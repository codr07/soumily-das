// Generic API Wrapper using jQuery AJAX
const API = {
    request: function(method, endpoint, data = null) {
        return new Promise((resolve, reject) => {
            $.ajax({
                url: `/api${endpoint}`,
                type: method,
                contentType: 'application/json',
                data: data ? JSON.stringify(data) : null,
                xhrFields: {
                    withCredentials: true // send httponly cookies (JWT) with requests
                },
                success: function(response) {
                    resolve(response);
                },
                error: function(xhr) {
                    let errMsg = 'An error occurred';
                    if (xhr.responseJSON && xhr.responseJSON.error) {
                        errMsg = xhr.responseJSON.error;
                    }
                    reject(errMsg);
                }
            });
        });
    },

    // Auth
    login: (email, password) => API.request('POST', '/auth/login', { email, password }),
    register: (userData) => API.request('POST', '/auth/register', userData),
    logout: () => API.request('POST', '/auth/logout'),

    // Inventory
    getProducts: () => API.request('GET', '/inventory/products'),
    addProduct: (data) => API.request('POST', '/inventory/products', data),

    // Orders
    placeOrder: (data) => API.request('POST', '/orders', data),
    getOrders: () => API.request('GET', '/orders'),
    
    // Reports
    getSalesSummary: () => API.request('GET', '/reports/sales/summary')
};
