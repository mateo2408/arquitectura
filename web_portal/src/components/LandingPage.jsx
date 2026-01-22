import React, { useState } from 'react';

const LandingPage = ({ onLogin }) => {
    const [showLoginModal, setShowLoginModal] = useState(false);
    const [doctorName, setDoctorName] = useState('');

    const handleLoginSubmit = (e) => {
        e.preventDefault();
        if (doctorName.trim()) {
            onLogin({ name: `Dr. ${doctorName}`, role: 'Veterinarian' });
        }
    };

    return (
        <div className="min-h-screen bg-[#1E1E2C] text-white flex flex-col relative overflow-hidden">
            {/* Background Gradients */}
            <div className="absolute top-[-20%] left-[-10%] w-[50%] h-[50%] rounded-full bg-primary/20 blur-[120px]" />
            <div className="absolute bottom-[-20%] right-[-10%] w-[50%] h-[50%] rounded-full bg-secondary/20 blur-[120px]" />

            {/* Navbar */}
            <nav className="glass sticky top-0 z-50 px-8 py-4 flex justify-between items-center border-b border-white/5">
                <div className="flex items-center gap-3">
                    <div className="w-10 h-10 rounded-full bg-gradient-to-tr from-primary to-secondary flex items-center justify-center font-bold text-lg">
                        PA
                    </div>
                    <span className="text-xl font-bold">PetAuthority <span className="text-primary font-normal">Vet</span></span>
                </div>
                <div className="flex gap-4">
                    <button
                        onClick={() => setShowLoginModal(true)}
                        className="px-6 py-2 rounded-xl border border-white/10 hover:bg-white/5 transition"
                    >
                        Log In
                    </button>
                    <button
                        onClick={() => setShowLoginModal(true)}
                        className="px-6 py-2 rounded-xl bg-primary hover:bg-primary/80 transition shadow-lg shadow-primary/25"
                    >
                        Sign Up
                    </button>
                </div>
            </nav>

            {/* Hero Section */}
            <main className="flex-1 flex items-center justify-center p-6">
                <div className="max-w-6xl w-full grid grid-cols-1 lg:grid-cols-2 gap-12 items-center">
                    <div className="space-y-8">
                        <div className="inline-block px-4 py-2 rounded-full glass border border-primary/30 text-primary text-sm font-medium">
                            For Veterinary Professionals
                        </div>
                        <h1 className="text-5xl lg:text-7xl font-bold leading-tight">
                            The Future of <br />
                            <span className="text-transparent bg-clip-text bg-gradient-to-r from-primary to-secondary">
                                Veterinary Care
                            </span>
                        </h1>
                        <p className="text-xl text-gray-400 max-w-lg">
                            Manage patient records, track medical histories, and monitor real-time health data in one premium glass-interface dashboard.
                        </p>
                        <div className="flex flex-wrap gap-4">
                            <button
                                onClick={() => setShowLoginModal(true)}
                                className="px-8 py-4 rounded-2xl bg-gradient-to-r from-primary to-secondary text-white font-bold text-lg hover:opacity-90 transition shadow-xl shadow-primary/20"
                            >
                                Access Portal
                            </button>
                            <button className="px-8 py-4 rounded-2xl glass border border-white/10 hover:bg-white/5 transition text-lg">
                                Watch Demo
                            </button>
                        </div>

                        <div className="pt-8 flex gap-8 text-gray-500">
                            <div>
                                <p className="text-3xl font-bold text-white">2.5k+</p>
                                <p className="text-sm">Vets Trusted</p>
                            </div>
                            <div>
                                <p className="text-3xl font-bold text-white">120k+</p>
                                <p className="text-sm">Pets Managed</p>
                            </div>
                            <div>
                                <p className="text-3xl font-bold text-white">99.9%</p>
                                <p className="text-sm">Uptime</p>
                            </div>
                        </div>
                    </div>

                    {/* Decorative UI Mockup */}
                    <div className="relative">
                        <div className="absolute inset-0 bg-gradient-to-tr from-primary to-secondary rounded-full blur-[100px] opacity-20" />
                        <div className="glass-card p-6 rounded-3xl border border-white/10 relative transform rotate-[-5deg] hover:rotate-0 transition duration-500">
                            <div className="flex justify-between items-center mb-6">
                                <div>
                                    <h3 className="text-lg font-bold">Patient Statistics</h3>
                                    <p className="text-xs text-gray-400">Past 30 Days</p>
                                </div>
                                <div className="p-2 bg-white/5 rounded-lg">📈</div>
                            </div>
                            <div className="space-y-4">
                                <div className="h-24 bg-white/5 rounded-xl flex items-end p-2 gap-2">
                                    <div className="w-1/5 h-[40%] bg-primary/20 rounded-md"></div>
                                    <div className="w-1/5 h-[70%] bg-primary/40 rounded-md"></div>
                                    <div className="w-1/5 h-[50%] bg-primary/60 rounded-md"></div>
                                    <div className="w-1/5 h-[90%] bg-primary/80 rounded-md"></div>
                                    <div className="w-1/5 h-[60%] bg-primary rounded-md"></div>
                                </div>
                                <div className="flex gap-4">
                                    <div className="flex-1 p-3 bg-white/5 rounded-xl">
                                        <p className="text-xs text-gray-400">New Patients</p>
                                        <p className="text-xl font-bold">+124</p>
                                    </div>
                                    <div className="flex-1 p-3 bg-white/5 rounded-xl">
                                        <p className="text-xs text-gray-400">Vaccinations</p>
                                        <p className="text-xl font-bold text-secondary">85%</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </main>

            {/* Login Modal */}
            {showLoginModal && (
                <div className="fixed inset-0 z-[100] flex items-center justify-center bg-black/60 backdrop-blur-md p-4">
                    <div className="glass-card w-full max-w-sm rounded-2xl p-8 relative animate-in fade-in zoom-in duration-300">
                        <button onClick={() => setShowLoginModal(false)} className="absolute top-4 right-4 text-gray-400 hover:text-white">✕</button>
                        <h2 className="text-2xl font-bold mb-2 text-center">Welcome Back</h2>
                        <p className="text-gray-400 text-center mb-6 text-sm">Enter your credentials to access the portal</p>

                        <form onSubmit={handleLoginSubmit} className="space-y-4">
                            <div>
                                <label className="block text-xs font-semibold text-gray-400 mb-1 uppercase tracking-wider">Last Name</label>
                                <input
                                    autoFocus
                                    required
                                    type="text"
                                    placeholder="e.g. Smith"
                                    className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-primary transition-colors"
                                    value={doctorName}
                                    onChange={e => setDoctorName(e.target.value)}
                                />
                            </div>

                            <button type="submit" className="w-full bg-gradient-to-r from-primary to-secondary hover:opacity-90 text-white font-bold py-3 rounded-xl transition shadow-lg shadow-primary/25 mt-2">
                                Enter Portal
                            </button>
                        </form>
                    </div>
                </div>
            )}
        </div>
    );
};

export default LandingPage;
