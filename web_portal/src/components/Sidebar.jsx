import React from 'react';

const Sidebar = ({ activeTab, onTabChange, onLogout, user }) => {
    return (
        <aside className="w-64 glass border-r border-white/10 h-screen fixed left-0 top-0 flex flex-col pt-6 pb-6 z-50">
            <div className="px-6 mb-10 flex items-center gap-3">
                <div className="w-8 h-8 rounded-full bg-gradient-to-tr from-primary to-secondary flex items-center justify-center text-white font-bold">
                    PA
                </div>
                {/* Portal Name Removed as requested */}
            </div>

            <nav className="flex-1 px-4 space-y-2">
                <NavItem icon="📊" label="Dashboard" active={activeTab === 'Dashboard'} onClick={() => onTabChange('Dashboard')} />
                <NavItem icon="🐾" label="Patients" active={activeTab === 'Patients'} onClick={() => onTabChange('Patients')} />
                <NavItem icon="📅" label="Schedule" active={activeTab === 'Schedule'} onClick={() => alert('Schedule Feature Coming Soon')} />
                <NavItem icon="📦" label="Supplies" active={activeTab === 'Store'} onClick={() => onTabChange('Store')} />
                <NavItem icon="⚙️" label="Settings" active={activeTab === 'Settings'} onClick={() => onTabChange('Settings')} />
            </nav>

            <div className="px-6 pt-6 border-t border-white/10">
                <div className="flex items-center gap-3 mb-4">
                    <div className="w-10 h-10 rounded-full bg-gray-600 flex items-center justify-center text-xs">Dr.</div>
                    <div>
                        <p className="text-sm font-medium">{user?.name || 'Veterinarian'}</p>
                        <p className="text-xs text-secondary">{user?.role || 'Staff'}</p>
                    </div>
                </div>
                <button
                    onClick={onLogout}
                    className="w-full py-2 rounded-xl border border-white/10 text-xs text-gray-400 hover:bg-white/5 hover:text-white transition"
                >
                    Log Out
                </button>
            </div>
        </aside>
    );
};

const NavItem = ({ icon, label, active, onClick }) => (
    <button
        onClick={onClick}
        className={`w-full flex items-center gap-3 px-4 py-3 rounded-xl transition-all ${active
            ? 'bg-primary/20 text-white shadow-lg shadow-primary/20'
            : 'text-gray-400 hover:bg-white/5 hover:text-white'
            }`}
    >
        <span>{icon}</span>
        <span className="font-medium">{label}</span>
    </button>
);

export default Sidebar;
