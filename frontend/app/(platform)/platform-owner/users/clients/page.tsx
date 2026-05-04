import UsersTable from '@/components/platform-owner/UsersTable';

export default function PlatformOwnerClientsPage() {
  return (
    <div className="space-y-6 p-6">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Individual Clients</h1>
        <p className="text-sm text-gray-500 mt-1">All clients registered on the platform.</p>
      </div>
      <UsersTable userType="client" />
    </div>
  );
}
