import UsersTable from '@/components/platform-owner/UsersTable';

export default function PlatformOwnerAdvocatesPage() {
  return (
    <div className="space-y-6 p-6">
      <div>
        <h1 className="text-2xl font-bold text-gray-900">Individual Advocates</h1>
        <p className="text-sm text-gray-500 mt-1">All advocates registered on the platform — solo and firm-based.</p>
      </div>
      <UsersTable userType="advocate" />
    </div>
  );
}
