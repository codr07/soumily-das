$(document).ready(function() {
    // Check local storage for auth state to update UI
    const userRole = localStorage.getItem('userRole');
    const username = localStorage.getItem('username');

    if (userRole) {
        $('#authSection').html(`
            <span class="navbar-text me-3 text-white">Hello, <strong>${username}</strong> (${userRole})</span>
            <a href="dashboard.html" class="btn btn-outline-light me-2">Dashboard</a>
            <button id="logoutBtn" class="btn btn-warning">Logout</button>
        `);
    }

    // Handle Logout
    $(document).on('click', '#logoutBtn', function() {
        API.logout().then(() => {
            localStorage.clear();
            window.location.href = 'index.html';
        }).catch(err => alert(err));
    });

    // Cart Management
    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    
    function updateCartCount() {
        const count = cart.reduce((acc, item) => acc + item.quantity, 0);
        $('#cartCount').text(count);
    }
    updateCartCount();

    // Add to cart click event dynamically bound
    $(document).on('click', '.addToCartBtn', function() {
        const id = parseInt($(this).data('id'));
        const name = $(this).data('name');
        const price = parseFloat($(this).data('price'));

        const existingItem = cart.find(item => item.product_id === id);
        if (existingItem) {
            existingItem.quantity += 1;
        } else {
            cart.push({ product_id: id, name, price, quantity: 1 });
        }

        localStorage.setItem('cart', JSON.stringify(cart));
        updateCartCount();
        
        // Visual feedback
        const btn = $(this);
        const originalText = btn.text();
        btn.text('Added!').removeClass('btn-success').addClass('btn-secondary');
        setTimeout(() => {
            btn.text(originalText).removeClass('btn-secondary').addClass('btn-success');
        }, 1000);
    });

    // Buy Now click event directly goes to checkout
    $(document).on('click', '.buyNowBtn', function() {
        const id = parseInt($(this).data('id'));
        const name = $(this).data('name');
        const price = parseFloat($(this).data('price'));

        const existingItem = cart.find(item => item.product_id === id);
        if (existingItem) {
            existingItem.quantity += 1;
        } else {
            cart.push({ product_id: id, name, price, quantity: 1 });
        }

        localStorage.setItem('cart', JSON.stringify(cart));
        window.location.href = 'checkout.html';
    });

    // Go to checkout via header button
    $('#cartLink').click(function(e) {
        e.preventDefault();
        window.location.href = 'checkout.html';
    });
});
