import { useState, useEffect } from 'react';
import api from '../services/api';

export default function PetList() {
    const [pets, setPets] = useState([]);
    const [loading, setLoading] = useState(true);
    const [error, setError] = useState(null);

    useEffect(() => {
        fetchPets();
    }, []);

    const fetchPets = async () => {
        try {
            const response = await api.get('/pets');
            setPets(response.data);
            setLoading(false);
        } catch (err) {
            console.error("Failed to fetch pets:", err);
            setError("Could not load pets. Ensure backend is running.");
            setLoading(false);
        }
    };

    if (loading) return <div className="text-center p-4 text-white">Loading pets...</div>;
    if (error) return <div className="text-center p-4 text-red-200 bg-red-900/50 rounded-lg">{error}</div>;

    return (
        <div className="overflow-hidden">
            <ul className="divide-y divide-white/20">
                {pets.length === 0 ? (
                    <li className="px-4 py-8 text-center text-white/70 italic text-lg">
                        No hay mascotas registradas aún.
                    </li>
                ) : (
                    pets.map((pet) => (
                        <li key={pet.id} className="hover:bg-white/10 transition duration-200">
                            <div className="px-6 py-5 flex items-center justify-between">
                                <div className="flex items-center space-x-4">
                                    <div className="h-12 w-12 rounded-full bg-gradient-to-r from-blue-400 to-cyan-300 flex items-center justify-center text-white font-bold text-xl shadow-lg">
                                        {pet.name.charAt(0)}
                                    </div>
                                    <div>
                                        <p className="text-lg font-bold text-white">{pet.name}</p>
                                        <p className="text-sm text-white/70 flex items-center">
                                            <span className="mr-2">{pet.species}</span> • <span className="ml-2">{pet.breed}</span>
                                        </p>
                                    </div>
                                </div>

                                <div className="text-right">
                                    <span className="inline-flex items-center px-3 py-1 rounded-full text-xs font-medium bg-purple-500/30 text-purple-100 border border-purple-400/30 backdrop-blur-md">
                                        ID Dueño: {pet.ownerId}
                                    </span>
                                    <p className="text-xs text-white/50 mt-1">
                                        Reg: {new Date().toLocaleDateString()}
                                    </p>
                                </div>
                            </div>
                        </li>
                    ))
                )}
            </ul>
        </div>
    );
}
