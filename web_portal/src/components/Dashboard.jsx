import React from 'react';

const Dashboard = ({ user }) => {
    return (
        <div className="p-6">
            <header className="mb-8">
                <h1 className="text-3xl font-bold text-white">Veterinary Overview</h1>
                <p className="text-gray-400">Good Morning, {user?.name || 'Doctor'}</p>
            </header>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mb-8">
                <StatCard title="Total Patients" value="128" icon="🐾" color="bg-purple-500/20 text-purple-400" />
                <StatCard title="Appointments Today" value="8" icon="📅" color="bg-teal-500/20 text-teal-400" />
                <StatCard title="Critical Alerts" value="2" icon="⚠️" color="bg-orange-500/20 text-orange-400" />
            </div>

            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
                <div className="glass-card rounded-2xl p-6">
                    <h2 className="text-xl font-semibold mb-4">Upcoming Schedule</h2>
                    <div className="space-y-4">
                        <ActivityItem title="Max (Golden Retriever) - Checkup" date="10:00 AM" />
                        <ActivityItem title="Bella (Siamese) - Vaccination" date="11:30 AM" />
                        <ActivityItem title="Charlie (Beagle) - Surgery Follow-up" date="02:00 PM" />
                    </div>
                </div>

                <div className="glass-card rounded-2xl p-6">
                    <h2 className="text-xl font-semibold mb-4">Quick Actions</h2>
                    <div className="grid grid-cols-2 gap-4">
                        <button onClick={() => alert('Opening Patient Registration...')} className="glass p-4 rounded-xl hover:bg-white/10 transition cursor-pointer">Register Patient</button>
                        <button onClick={() => alert('Opening Prescription Writer...')} className="glass p-4 rounded-xl hover:bg-white/10 transition cursor-pointer">Write Prescription</button>
                        <button onClick={() => alert('Opening Lab Requests...')} className="glass p-4 rounded-xl hover:bg-white/10 transition cursor-pointer">Lab Request</button>
                        <button onClick={() => alert('Opening Clinic Settings...')} className="glass p-4 rounded-xl hover:bg-white/10 transition cursor-pointer">Clinic Settings</button>
                    </div>
                </div>
            </div>
        </div>
    );
};

const StatCard = ({ title, value, icon, color }) => (
    <div className="glass-card rounded-2xl p-6 flex items-center justify-between">
        <div>
            <p className="text-gray-400 text-sm">{title}</p>
            <p className="text-2xl font-bold mt-1">{value}</p>
        </div>
        <div className={`p-3 rounded-full ${color} text-2xl`}>
            {icon}
        </div>
    </div>
);

const ActivityItem = ({ title, date }) => (
    <div className="flex items-center justify-between border-b border-white/10 pb-3 last:border-0 last:pb-0">
        <span className="font-medium">{title}</span>
        <span className="text-sm text-secondary">{date}</span>
    </div>
)

export default Dashboard;
