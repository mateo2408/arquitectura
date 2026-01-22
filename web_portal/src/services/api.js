import axios from 'axios';

// Create an axios instance with a custom config
const api = axios.create({
    baseURL: 'http://localhost:8082', // Pointing directly to backend
    headers: {
        'Content-Type': 'application/json',
    },
});

export default api;
