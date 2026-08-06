'use client';

import React, { useState } from 'react';
import {
  ChevronLeft,
  ChevronRight,
  Calendar as CalendarIcon,
  Plus,
  Clock,
  MapPin,
  Scale,
  List,
  User,
  ChevronDown,
  Loader2,
  MoreHorizontal
} from 'lucide-react';
import { motion } from 'framer-motion';

export interface CalendarEvent {
  id: string;
  title: string;
  date: Date;
  time: string;
  type: 'hearing' | 'task' | 'deadline' | 'meeting' | 'consultation' | 'filing' | 'other';
  caseNumber?: string;
  clientName?: string;
  adminName: string;
  role: string;
}

interface ProfessionalCalendarProps {
  events: CalendarEvent[];
  isLoading?: boolean;
  role?: string;
  onDateChange?: (date: Date) => void;
  onViewChange?: (view: 'day' | 'week' | 'month') => void;
  onAddEvent?: (date: Date) => void;
  onEventClick?: (id: string) => void;
}

const EVENT_STYLES: Record<string, any> = {
  hearing: {
    bg: 'bg-purple-50/90 hover:bg-purple-100/90',
    border: 'border-purple-200/80',
    text: 'text-purple-950',
    dot: 'bg-purple-600',
    icon: <Scale className="w-3.5 h-3.5" />
  },
  meeting: {
    bg: 'bg-blue-50/90 hover:bg-blue-100/90',
    border: 'border-blue-200/80',
    text: 'text-blue-950',
    dot: 'bg-blue-600',
    icon: <User className="w-3.5 h-3.5" />
  },
  deadline: {
    bg: 'bg-red-50/90 hover:bg-red-100/90',
    border: 'border-red-200/80',
    text: 'text-red-950',
    dot: 'bg-red-600',
    icon: <Clock className="w-3.5 h-3.5" />
  },
  consultation: {
    bg: 'bg-emerald-50/90 hover:bg-emerald-100/90',
    border: 'border-emerald-200/80',
    text: 'text-emerald-950',
    dot: 'bg-emerald-600',
    icon: <User className="w-3.5 h-3.5" />
  },
  filing: {
    bg: 'bg-emerald-50/90 hover:bg-emerald-100/90',
    border: 'border-emerald-200/80',
    text: 'text-emerald-950',
    dot: 'bg-emerald-600',
    icon: <CalendarIcon className="w-3.5 h-3.5" />
  },
  task: {
    bg: 'bg-amber-50/90 hover:bg-amber-100/90',
    border: 'border-amber-200/80',
    text: 'text-amber-950',
    dot: 'bg-amber-600',
    icon: <List className="w-3.5 h-3.5" />
  },
  other: {
    bg: 'bg-amber-50/90 hover:bg-amber-100/90',
    border: 'border-amber-200/80',
    text: 'text-amber-950',
    dot: 'bg-amber-600',
    icon: <MoreHorizontal className="w-3.5 h-3.5" />
  }
};

export default function ProfessionalCalendar({
  events,
  isLoading,
  onDateChange,
  onViewChange,
  onAddEvent,
  onEventClick
}: ProfessionalCalendarProps) {
  const [currentDate, setCurrentDate] = useState(new Date());
  const [view, setView] = useState<'day' | 'week' | 'month'>('month');
  const dateInputRef = React.useRef<HTMLInputElement>(null);

  const formatDateToYYYYMMDD = (d: Date) => {
    const year = d.getFullYear();
    const month = String(d.getMonth() + 1).padStart(2, '0');
    const day = String(d.getDate()).padStart(2, '0');
    return `${year}-${month}-${day}`;
  };

  const handleTriggerDatePicker = () => {
    if (dateInputRef.current) {
      if (typeof dateInputRef.current.showPicker === 'function') {
        try {
          dateInputRef.current.showPicker();
        } catch {
          dateInputRef.current.focus();
        }
      } else {
        dateInputRef.current.focus();
      }
    }
  };

  const getDaysInMonth = (date: Date) => {
    const year = date.getFullYear();
    const month = date.getMonth();
    const daysInMonth = new Date(year, month + 1, 0).getDate();
    const firstDayOfMonth = new Date(year, month, 1).getDay();

    const days = [];
    const prevMonthLastDay = new Date(year, month, 0).getDate();
    for (let i = firstDayOfMonth - 1; i >= 0; i--) {
      days.push({ date: new Date(year, month - 1, prevMonthLastDay - i), isCurrentMonth: false });
    }
    for (let i = 1; i <= daysInMonth; i++) {
      days.push({ date: new Date(year, month, i), isCurrentMonth: true });
    }
    const remainingDays = 42 - days.length;
    for (let i = 1; i <= remainingDays; i++) {
      days.push({ date: new Date(year, month + 1, i), isCurrentMonth: false });
    }
    return days;
  };

  const handleDateNavigation = (direction: 'next' | 'prev') => {
    let newDate = new Date(currentDate);
    if (view === 'month') {
      newDate.setMonth(currentDate.getMonth() + (direction === 'next' ? 1 : -1));
    } else if (view === 'week') {
      newDate.setDate(currentDate.getDate() + (direction === 'next' ? 7 : -7));
    } else {
      newDate.setDate(currentDate.getDate() + (direction === 'next' ? 1 : -1));
    }
    setCurrentDate(newDate);
    onDateChange?.(newDate);
  };

  const handleDatePickerChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const val = e.target.value;
    if (val) {
      const [year, month, day] = val.split('-').map(Number);
      const newDate = new Date(year, month - 1, day);
      if (!isNaN(newDate.getTime())) {
        setCurrentDate(newDate);
        onDateChange?.(newDate);
      }
    }
  };

  const monthDays = getDaysInMonth(currentDate);
  const weekDays = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];

  const formattedSelectedDate = currentDate.toLocaleDateString('en-GB', {
    day: '2-digit',
    month: 'long',
    year: 'numeric'
  });

  return (
    <div className="bg-white rounded-2xl shadow-sm border border-gray-200 overflow-hidden flex flex-col min-h-[520px]">
      {/* Header Bar */}
      <div className="px-5 py-3 border-b border-gray-100 bg-white flex flex-wrap items-center justify-between gap-3">
        {/* Left Section: Nav buttons + Date Picker */}
        <div className="flex items-center gap-2.5">
          <div className="flex items-center gap-1">
            <button
              onClick={() => handleDateNavigation('prev')}
              className="p-1.5 border border-gray-200 hover:bg-gray-50 rounded-lg transition-all text-gray-700"
              title="Previous"
            >
              <ChevronLeft className="w-4 h-4" />
            </button>
            <button
              onClick={() => handleDateNavigation('next')}
              className="p-1.5 border border-gray-200 hover:bg-gray-50 rounded-lg transition-all text-gray-700"
              title="Next"
            >
              <ChevronRight className="w-4 h-4" />
            </button>
            <button
              onClick={() => {
                const today = new Date();
                setCurrentDate(today);
                onDateChange?.(today);
              }}
              className="px-3 py-1.5 border border-gray-200 hover:bg-gray-50 rounded-lg text-xs font-bold text-gray-700 transition-all"
            >
              Today
            </button>
          </div>

          <button
            type="button"
            onClick={handleTriggerDatePicker}
            className="relative flex items-center gap-1.5 px-3 py-1.5 bg-gray-50 border border-gray-200 rounded-lg focus:ring-2 focus:ring-[#2d0b25] transition-all cursor-pointer hover:bg-gray-100/80 active:scale-95"
          >
            <CalendarIcon className="w-3.5 h-3.5 text-gray-500" />
            <span className="text-xs font-bold text-gray-800 pointer-events-none">{formattedSelectedDate}</span>
            <ChevronDown className="w-3 h-3 text-gray-400 pointer-events-none ml-0.5" />
            <input
              ref={dateInputRef}
              type="date"
              className="absolute inset-0 opacity-0 cursor-pointer w-full h-full -z-10"
              value={formatDateToYYYYMMDD(currentDate)}
              onChange={handleDatePickerChange}
            />
          </button>
        </div>

        {/* Center: Month Year Title */}
        <h1 className="text-xl font-bold text-[#2d0b25] tracking-tight">
          {currentDate.toLocaleString('default', { month: 'long', year: 'numeric' })}
        </h1>

        {/* Right Section: View selector + Add Event button */}
        <div className="flex items-center gap-2.5">
          <div className="flex bg-gray-100/80 p-0.5 rounded-lg">
            {(['day', 'week', 'month'] as const).map((v) => (
              <button
                key={v}
                onClick={() => {
                  setView(v);
                  onViewChange?.(v);
                }}
                className={`px-3 py-1 rounded-md text-[11px] font-bold transition-all uppercase tracking-wider ${
                  view === v
                    ? 'bg-[#2d0b25] text-white shadow-xs'
                    : 'text-gray-500 hover:text-gray-800'
                }`}
              >
                {v}
              </button>
            ))}
          </div>

          {onAddEvent && (
            <button
              onClick={() => onAddEvent(currentDate)}
              className="flex items-center gap-1.5 bg-[#2d0b25] hover:bg-[#1a0616] text-white px-3 py-1.5 rounded-lg font-bold text-xs transition-all shadow-xs active:scale-95"
            >
              <Plus className="w-3.5 h-3.5" />
              <span>Add Event</span>
            </button>
          )}
        </div>
      </div>

      {/* Main Calendar Body */}
      <div className="flex-1 relative bg-white flex flex-col">
        {isLoading && (
          <div className="absolute inset-0 z-50 bg-white/60 flex items-center justify-center backdrop-blur-[1px]">
            <Loader2 className="w-7 h-7 text-[#2d0b25] animate-spin" />
          </div>
        )}

        {/* MONTH VIEW */}
        {view === 'month' && (
          <div className="h-full flex flex-col flex-1">
            <div className="grid grid-cols-7 border-b border-gray-100 bg-white">
              {weekDays.map((day) => (
                <div key={day} className="py-2 text-center text-[10px] font-bold text-gray-400 uppercase tracking-wider">
                  {day}
                </div>
              ))}
            </div>

            <div className="flex-1 grid grid-cols-7 grid-rows-6">
              {monthDays.map((day, idx) => {
                const dayEvents = events.filter(
                  (e) =>
                    e.date.getDate() === day.date.getDate() &&
                    e.date.getMonth() === day.date.getMonth() &&
                    e.date.getFullYear() === day.date.getFullYear()
                );
                const today = new Date();
                const isToday =
                  day.date.getDate() === today.getDate() &&
                  day.date.getMonth() === today.getMonth() &&
                  day.date.getFullYear() === today.getFullYear();

                return (
                  <div
                    key={idx}
                    onClick={() => onAddEvent?.(day.date)}
                    className={`min-h-[82px] p-1.5 border-r border-b border-gray-100 flex flex-col gap-0.5 ${
                      onAddEvent ? 'cursor-pointer hover:bg-gray-50/60' : 'cursor-default'
                    } transition-colors ${!day.isCurrentMonth ? 'bg-gray-50/20' : 'bg-white'}`}
                  >
                    <div className="flex justify-between items-center mb-0.5">
                      <span
                        className={`text-[11px] font-bold w-5 h-5 flex items-center justify-center rounded-full ${
                          isToday
                            ? 'bg-[#2d0b25] text-white shadow-xs font-black'
                            : !day.isCurrentMonth
                            ? 'text-gray-300'
                            : 'text-gray-700'
                        }`}
                      >
                        {day.date.getDate()}
                      </span>
                    </div>

                    {dayEvents.slice(0, 3).map((event, eventIdx) => {
                      const style = EVENT_STYLES[event.type] || EVENT_STYLES.other;
                      const subtitle = event.clientName || event.caseNumber || '';

                      return (
                        <div
                          key={`${event.id}-${idx}-${eventIdx}`}
                          onClick={(e) => {
                            e.stopPropagation();
                            onEventClick?.(event.id);
                          }}
                          className={`p-1.5 px-2 rounded-lg border ${style.bg} ${style.border} ${style.text} transition-all cursor-pointer shadow-2xs hover:shadow-xs mb-0.5 leading-tight`}
                        >
                          <div className="flex items-center gap-1">
                            <span className={`w-1.5 h-1.5 rounded-full shrink-0 ${style.dot}`} />
                            <span className="text-[9px] font-extrabold uppercase tracking-tight opacity-85">
                              {event.time}
                            </span>
                          </div>
                          <p className="text-[11px] font-bold line-clamp-1 text-gray-900 mt-0.5">{event.title}</p>
                          {subtitle && <p className="text-[9px] font-medium text-gray-500 truncate">{subtitle}</p>}
                        </div>
                      );
                    })}

                    {dayEvents.length > 3 && (
                      <span className="text-[9px] text-gray-400 font-bold ml-0.5">
                        +{dayEvents.length - 3} more
                      </span>
                    )}
                  </div>
                );
              })}
            </div>
          </div>
        )}

        {/* WEEK VIEW */}
        {view === 'week' && (
          <div className="h-full flex flex-col flex-1">
            <div className="grid grid-cols-7 border-b border-gray-100 bg-gray-50/40">
              {weekDays.map((day, idx) => {
                const date = new Date(currentDate);
                date.setDate(currentDate.getDate() - currentDate.getDay() + idx);
                const today = new Date();
                const isToday =
                  date.getDate() === today.getDate() &&
                  date.getMonth() === today.getMonth() &&
                  date.getFullYear() === today.getFullYear();
                return (
                  <div key={day} className="py-2.5 flex flex-col items-center gap-1 border-r border-gray-100 last:border-0">
                    <span className="text-[9px] font-extrabold text-gray-400 uppercase tracking-widest">{day}</span>
                    <span
                      className={`text-base font-black w-8 h-8 flex items-center justify-center rounded-lg transition-all ${
                        isToday ? 'bg-[#2d0b25] text-white shadow-xs' : 'text-gray-900'
                      }`}
                    >
                      {date.getDate()}
                    </span>
                  </div>
                );
              })}
            </div>

            <div className="flex-1 grid grid-cols-7 overflow-y-auto custom-scrollbar bg-white">
              {weekDays.map((_, idx) => {
                const date = new Date(currentDate);
                date.setDate(currentDate.getDate() - currentDate.getDay() + idx);
                const dayEvents = events.filter(
                  (e) =>
                    e.date.getDate() === date.getDate() &&
                    e.date.getMonth() === date.getMonth() &&
                    e.date.getFullYear() === date.getFullYear()
                );

                return (
                  <div
                    key={idx}
                    onClick={() => onAddEvent?.(date)}
                    className={`min-h-[360px] p-2 border-r border-gray-100 last:border-0 ${
                      onAddEvent ? 'hover:bg-gray-50/50 cursor-pointer' : 'cursor-default'
                    } transition-colors flex flex-col gap-2`}
                  >
                    {dayEvents.map((event, eventIdx) => {
                      const style = EVENT_STYLES[event.type] || EVENT_STYLES.other;
                      const subtitle = event.clientName || event.caseNumber || '';

                      return (
                        <motion.div
                          initial={{ opacity: 0, y: 6 }}
                          animate={{ opacity: 1, y: 0 }}
                          key={event.id ? `week-${event.id}-${eventIdx}` : `week-${idx}-${eventIdx}`}
                          onClick={(e) => {
                            e.stopPropagation();
                            onEventClick?.(event.id);
                          }}
                          className={`p-2 rounded-lg border ${style.bg} ${style.border} ${style.text} cursor-pointer hover:shadow-xs transition-all space-y-0.5`}
                        >
                          <div className="flex items-center gap-1">
                            <span className={`w-1.5 h-1.5 rounded-full shrink-0 ${style.dot}`} />
                            <span className="text-[9px] font-extrabold uppercase tracking-tight opacity-85">{event.time}</span>
                          </div>
                          <p className="text-[11px] font-bold leading-tight text-gray-900 line-clamp-2">{event.title}</p>
                          {subtitle && <p className="text-[9px] font-medium text-gray-500 truncate">{subtitle}</p>}
                        </motion.div>
                      );
                    })}
                  </div>
                );
              })}
            </div>
          </div>
        )}

        {/* DAY VIEW */}
        {view === 'day' && (
          <div className="p-6 h-full flex flex-col gap-4 max-w-3xl mx-auto overflow-y-auto custom-scrollbar flex-1 w-full">
            <div className="flex items-end justify-between border-b border-gray-200 pb-3">
              <div>
                <p className="text-gray-400 font-extrabold uppercase tracking-widest text-[10px] mb-0.5">
                  {currentDate.toLocaleString('default', { weekday: 'long' })}
                </p>
                <h2 className="text-2xl font-black text-gray-900">
                  {currentDate.getDate()} {currentDate.toLocaleString('default', { month: 'long' })}
                </h2>
              </div>
              <div className="text-right">
                <p className="text-gray-400 font-bold uppercase tracking-widest text-[10px] mb-0.5">Total Events</p>
                <p className="text-2xl font-black text-[#2d0b25]">{events.length}</p>
              </div>
            </div>

            <div className="space-y-3">
              {events.length === 0 ? (
                <div className="py-14 text-center text-gray-300 font-bold tracking-widest uppercase text-xs">
                  No events scheduled for today
                </div>
              ) : (
                events.map((event, eventIdx) => {
                  const style = EVENT_STYLES[event.type] || EVENT_STYLES.other;
                  const subtitle = event.clientName || event.caseNumber || '';

                  return (
                    <div
                      key={event.id ? `day-${event.id}-${eventIdx}` : `day-${eventIdx}`}
                      onClick={() => onEventClick?.(event.id)}
                      className={`flex items-center gap-4 p-4 rounded-xl border ${style.bg} ${style.border} transition-all hover:bg-white hover:shadow-md cursor-pointer group`}
                    >
                      <div className="w-20 text-center shrink-0">
                        <p className="text-base font-extrabold text-gray-900">{event.time}</p>
                        <p className="text-[9px] font-bold text-gray-400 uppercase">Start Time</p>
                      </div>
                      <div className="w-px h-10 bg-gray-200" />
                      <div className="flex-1">
                        <div className="flex items-center gap-2 mb-0.5">
                          <span className={`px-2 py-0.5 rounded text-[9px] font-bold uppercase border ${style.border} ${style.text}`}>
                            {event.type}
                          </span>
                          {subtitle && <span className="text-xs text-gray-500 font-semibold">{subtitle}</span>}
                        </div>
                        <h3 className="text-sm font-bold text-gray-900 group-hover:text-[#2d0b25] transition-colors">
                          {event.title}
                        </h3>
                      </div>
                      <ChevronRight className="w-4 h-4 text-gray-300 group-hover:text-gray-600 transition-colors" />
                    </div>
                  );
                })
              )}
            </div>
          </div>
        )}
      </div>

      {/* Legend Footer */}
      <div className="px-5 py-2.5 bg-white border-t border-gray-100 flex items-center gap-5 overflow-x-auto text-[11px] font-semibold text-gray-600">
        <div className="flex items-center gap-1.5">
          <span className="w-2 h-2 rounded-full bg-purple-600 shrink-0" />
          <span>Hearing</span>
        </div>
        <div className="flex items-center gap-1.5">
          <span className="w-2 h-2 rounded-full bg-blue-600 shrink-0" />
          <span>Meeting</span>
        </div>
        <div className="flex items-center gap-1.5">
          <span className="w-2 h-2 rounded-full bg-red-600 shrink-0" />
          <span>Deadline</span>
        </div>
        <div className="flex items-center gap-1.5">
          <span className="w-2 h-2 rounded-full bg-emerald-600 shrink-0" />
          <span>Review</span>
        </div>
        <div className="flex items-center gap-1.5">
          <span className="w-2 h-2 rounded-full bg-amber-600 shrink-0" />
          <span>Other</span>
        </div>
      </div>
    </div>
  );
}


