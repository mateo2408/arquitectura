import React, { useState, useEffect } from 'react';

const Patients = () => {
    const [pets, setPets] = useState([]);
    const [loading, setLoading] = useState(true);
    const [showAddModal, setShowAddModal] = useState(false);

    useEffect(() => {
        fetchPets();
    }, []);

    const fetchPets = async () => {
        try {
            const response = await fetch('http://localhost:8082/pets');
            if (response.ok) {
                const data = await response.json();
                setPets(data);
            } else {
                console.error("Failed to fetch pets");
            }
        } catch (error) {
            console.error("Error fetching pets:", error);
        } finally {
            setLoading(false);
        }
    };

    return (
        <div className="p-6">
            <header className="flex justify-between items-center mb-8">
                <div>
                    <h1 className="text-3xl font-bold text-white">Patients</h1>
                    <p className="text-gray-400">Manage registered pets</p>
                </div>
                <button
                    onClick={() => setShowAddModal(true)}
                    className="bg-primary hover:bg-primary/80 text-white px-6 py-3 rounded-xl font-medium transition shadow-lg shadow-primary/25"
                >
                    + Add New Patient
                </button>
            </header>

            <div className="glass-card rounded-2xl overflow-hidden">
                <div className="p-4 border-b border-white/10 flex gap-4">
                    <input
                        type="text"
                        placeholder="Search patients..."
                        className="bg-white/5 border border-white/10 rounded-xl px-4 py-2 text-white w-full max-w-md focus:outline-none focus:border-primary/50"
                    />
                </div>

                {loading ? (
                    <div className="p-8 text-center text-gray-400">Loading patients...</div>
                ) : (
                    <table className="w-full text-left">
                        <thead className="bg-white/5 text-gray-400 text-sm">
                            <tr>
                                <th className="p-4 font-medium">Pet Name</th>
                                <th className="p-4 font-medium">Species</th>
                                <th className="p-4 font-medium">Breed</th>
                                <th className="p-4 font-medium">Owner ID</th>
                                <th className="p-4 font-medium">Actions</th>
                            </tr>
                        </thead>
                        <tbody className="divide-y divide-white/5">
                            {pets.map(pet => (
                                <tr key={pet.id} className="hover:bg-white/5 transition">
                                    <td className="p-4 font-medium text-white">{pet.name}</td>
                                    <td className="p-4 text-gray-300">{pet.species}</td>
                                    <td className="p-4 text-gray-300">{pet.breed}</td>
                                    <td className="p-4 text-gray-300">#{pet.ownerId}</td>
                                    <td className="p-4">
                                        <button className="text-primary hover:text-white transition">View</button>
                                    </td>
                                </tr>
                            ))}
                            {pets.length === 0 && (
                                <tr>
                                    <td colSpan="5" className="p-8 text-center text-gray-500">
                                        No patients found. Add one to get started.
                                    </td>
                                </tr>
                            )}
                        </tbody>
                    </table>
                )}
            </div>

            {showAddModal && (
                <AddPetModal
                    onClose={() => setShowAddModal(false)}
                    onSuccess={() => {
                        setShowAddModal(false);
                        fetchPets();
                    }}
                />
            )}
        </div>
    );
};

const AddPetModal = ({ onClose, onSuccess }) => {
    const [formData, setFormData] = useState({
        name: '',
        species: 'Dog',
        breed: '',
        birthDate: '',
        ownerId: 1
    });

    const handleSubmit = async (e) => {
        e.preventDefault();
        try {
            const response = await fetch('http://localhost:8082/pets', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify(formData)
            });

            if (response.ok) {
                onSuccess();
            } else {
                alert('Failed to create pet');
            }
        } catch (error) {
            console.error('Error creating pet:', error);
            alert('Error creating pet');
        }
    };

    return (
        <div className="fixed inset-0 z-[100] flex items-center justify-center bg-black/50 backdrop-blur-sm p-4">
            <div className="glass-card w-full max-w-md rounded-2xl p-6 relative">
                <button onClick={onClose} className="absolute top-4 right-4 text-gray-400 hover:text-white">✕</button>
                <h2 className="text-2xl font-bold mb-6">Register New Patient</h2>

                <form onSubmit={handleSubmit} className="space-y-4">
                    <div>
                        <label className="block text-sm text-gray-400 mb-1">Pet Name</label>
                        <input
                            required
                            type="text"
                            className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-primary"
                            value={formData.name}
                            onChange={e => setFormData({ ...formData, name: e.target.value })}
                        />
                    </div>

                    <div className="grid grid-cols-2 gap-4">
                        <div>
                            <label className="block text-sm text-gray-400 mb-1">Species</label>
                            <select
                                className="w-full bg-[#2D2D44] border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-primary appearance-none"
                                value={formData.species}
                                onChange={e => setFormData({ ...formData, species: e.target.value })}
                            >
                                <option value="Dog">Dog</option>
                                <option value="Cat">Cat</option>
                                <option value="Bird">Bird</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        <div>
                            <label className="block text-sm text-gray-400 mb-1">Breed</label>
                            <input
                                type="text"
                                className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-primary"
                                value={formData.breed}
                                onChange={e => setFormData({ ...formData, breed: e.target.value })}
                            />
                        </div>
                    </div>

                    <div>
                        <label className="block text-sm text-gray-400 mb-1">Birth Date</label>
                        <input
                            required
                            type="date"
                            className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-primary"
                            value={formData.birthDate}
                            onChange={e => setFormData({ ...formData, birthDate: e.target.value })}
                        />
                    </div>

                    <div>
                        <label className="block text-sm text-gray-400 mb-1">Owner ID</label>
                        <input
                            required
                            type="number"
                            className="w-full bg-white/5 border border-white/10 rounded-xl px-4 py-3 text-white focus:outline-none focus:border-primary"
                            value={formData.ownerId}
                            onChange={e => setFormData({ ...formData, ownerId: parseInt(e.target.value) })}
                        />
                    </div>

                    <button type="submit" className="w-full bg-primary hover:bg-primary/80 text-white font-bold py-3 rounded-xl transition mt-4">
                        Register Pet
                    </button>
                </form>
            </div>
        </div>
    );
};

export default Patients;
