import React, { useState } from 'react';
import Sidebar from './components/Sidebar';
import Dashboard from './components/Dashboard';
import Patients from './components/Patients';
import LandingPage from './components/LandingPage';

function App() {
  const [user, setUser] = useState(null); // Changed from isAuthenticated boolean to user object
  const [activeTab, setActiveTab] = useState('Dashboard');

  if (!user) {
    return <LandingPage onLogin={(userData) => setUser(userData)} />;
  }

  const renderContent = () => {
    switch (activeTab) {
      case 'Dashboard':
        return <Dashboard user={user} />;
      case 'Patients':
        return <Patients />;
      case 'Veterinarians': // Might be renamed to "Colleagues" or removed for Vets
        return <PlaceholderView title="Colleagues" icon="🩺" />;
      case 'Store': // Vets might order supplies
        return <PlaceholderView title="Medical Supplies" icon="🛍️" />;
      case 'Settings':
        return <PlaceholderView title="Clinic Settings" icon="⚙️" />;
      default:
        return <Dashboard user={user} />;
    }
  };

  return (
    <div className="min-h-screen bg-[#1E1E2C] text-white flex">
      <Sidebar activeTab={activeTab} onTabChange={setActiveTab} onLogout={() => setUser(null)} user={user} />
      <main className="flex-1 ml-64 p-8">
        <div className="max-w-7xl mx-auto">
          {renderContent()}
        </div>
      </main>
    </div>
  );
}

const PlaceholderView = ({ title, icon }) => (
  <div className="flex flex-col items-center justify-center h-[60vh] text-center">
    <div className="text-6xl mb-4 opacity-20">{icon}</div>
    <h2 className="text-3xl font-bold mb-2">{title}</h2>
    <p className="text-gray-400">Feature coming soon in the next update.</p>
  </div>
);

export default App;
