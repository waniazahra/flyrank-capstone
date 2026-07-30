Website Development

Baseline (Weak Prompt)
Prompt:

Build a website.

Output:

Here's a basic webpage with a title, a welcome message, and a button.
<html><body>
<h1>Welcome to My Website</h1>
<p>This is a simple website.</p>
<button>Learn More</button>
</body>
</html>
Baseline Notes

What changed in the prompt:

None (Baseline).

What improved in the output:

N/A

What still failed:

The AI didn't know the website's purpose.
The design and content were too generic.
It wasn't useful for any real-world scenario.


Version 1:

Prompt:


Build an online bookstore website.


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>The Paper Nook — Online Bookstore</title>
  <style>
    /* --- Modern Reset & Variables --- */
    :root {
      --primary: #2c3e50;
      --accent: #e67e22;
      --bg: #f8f9fa;
      --card-bg: #ffffff;
      --text: #333333;
      --text-muted: #7f8c8d;
      --border: #e2e8f0;
      --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
      background-color: var(--bg);
      color: var(--text);
      line-height: 1.6;
    }

    /* --- Header & Nav --- */
    header {
      background: var(--card-bg);
      border-bottom: 1px solid var(--border);
      position: sticky;
      top: 0;
      z-index: 100;
    }

    .nav-container {
      max-width: 1200px;
      margin: 0 auto;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1rem 2rem;
    }

    .logo {
      font-size: 1.5rem;
      font-weight: 700;
      color: var(--primary);
      text-decoration: none;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .nav-actions {
      display: flex;
      gap: 1.5rem;
      align-items: center;
    }

    .cart-btn {
      background: none;
      border: none;
      font-size: 1.1rem;
      cursor: pointer;
      position: relative;
      padding: 0.5rem;
    }

    .cart-badge {
      position: absolute;
      top: 0;
      right: 0;
      background: var(--accent);
      color: white;
      font-size: 0.75rem;
      width: 18px;
      height: 18px;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: bold;
    }

    /* --- Hero Banner --- */
    .hero {
      background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);
      color: white;
      text-align: center;
      padding: 4rem 2rem;
    }

    .hero h1 {
      font-size: 2.5rem;
      margin-bottom: 1rem;
    }

    .hero p {
      font-size: 1.1rem;
      opacity: 0.9;
      max-width: 600px;
      margin: 0 auto;
    }

    /* --- Main Layout --- */
    .container {
      max-width: 1200px;
      margin: 2rem auto;
      padding: 0 2rem;
    }

    /* Controls & Filtering */
    .controls {
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
      gap: 1rem;
      margin-bottom: 2rem;
    }

    .search-input {
      padding: 0.6rem 1rem;
      border: 1px solid var(--border);
      border-radius: 6px;
      width: 250px;
      font-size: 0.9rem;
    }

    .filter-tags {
      display: flex;
      gap: 0.5rem;
    }

    .tag {
      background: var(--card-bg);
      border: 1px solid var(--border);
      padding: 0.4rem 1rem;
      border-radius: 20px;
      cursor: pointer;
      font-size: 0.85rem;
      transition: all 0.2s;
    }

    .tag.active, .tag:hover {
      background: var(--primary);
      color: white;
      border-color: var(--primary);
    }

    /* --- Book Grid --- */
    .book-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
      gap: 2rem;
    }

    .book-card {
      background: var(--card-bg);
      border-radius: 8px;
      overflow: hidden;
      box-shadow: var(--shadow);
      display: flex;
      flex-direction: column;
      transition: transform 0.2s;
    }

    .book-card:hover {
      transform: translateY(-4px);
    }

    .book-cover {
      width: 100%;
      height: 280px;
      object-fit: cover;
      background: #eee;
    }

    .book-info {
      padding: 1rem;
      display: flex;
      flex-direction: column;
      flex-grow: 1;
    }

    .book-title {
      font-size: 1rem;
      font-weight: 600;
      margin-bottom: 0.2rem;
    }

    .book-author {
      font-size: 0.85rem;
      color: var(--text-muted);
      margin-bottom: 0.8rem;
    }

    .book-footer {
      margin-top: auto;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .book-price {
      font-weight: 700;
      font-size: 1.1rem;
    }

    .btn-add {
      background: var(--accent);
      color: white;
      border: none;
      padding: 0.5rem 0.8rem;
      border-radius: 4px;
      cursor: pointer;
      font-weight: 600;
      transition: opacity 0.2s;
    }

    .btn-add:hover {
      opacity: 0.9;
    }

    /* --- Cart Drawer --- */
    .cart-drawer {
      position: fixed;
      top: 0;
      right: -400px;
      width: 380px;
      height: 100%;
      background: var(--card-bg);
      box-shadow: -2px 0 10px rgba(0,0,0,0.1);
      z-index: 200;
      transition: right 0.3s ease;
      display: flex;
      flex-direction: column;
    }

    .cart-drawer.open {
      right: 0;
    }

    .cart-header {
      padding: 1.5rem;
      border-bottom: 1px solid var(--border);
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .close-cart {
      background: none;
      border: none;
      font-size: 1.5rem;
      cursor: pointer;
    }

    .cart-items {
      flex-grow: 1;
      overflow-y: auto;
      padding: 1.5rem;
    }

    .cart-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 1rem;
      border-bottom: 1px solid var(--border);
      padding-bottom: 0.5rem;
    }

    .cart-footer {
      padding: 1.5rem;
      border-top: 1px solid var(--border);
    }

    .checkout-btn {
      width: 100%;
      background: var(--primary);
      color: white;
      border: none;
      padding: 0.8rem;
      border-radius: 6px;
      font-size: 1rem;
      cursor: pointer;
      margin-top: 1rem;
    }

    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.4);
      z-index: 150;
      display: none;
    }

    .overlay.open {
      display: block;
    }
  </style>
</head>
<body>

  <!-- Navigation Bar -->
  <header>
    <div class="nav-container">
      <a href="#" class="logo">📚 The Paper Nook</a>
      <div class="nav-actions">
        <button class="cart-btn" id="openCart">
          🛒
          <span class="cart-badge" id="cartCount">0</span>
        </button>
      </div>
    </div>
  </header>

  <!-- Hero Section -->
  <section class="hero">
    <h1>Find Your Next Great Read</h1>
    <p>Discover hand-picked bestsellers, classic novels, and hidden gems across all genres.</p>
  </section>

  <!-- Main Content -->
  <main class="container">
    <div class="controls">
      <input type="text" id="searchInput" class="search-input" placeholder="Search by title or author..." />
      <div class="filter-tags">
        <button class="tag active" data-category="all">All</button>
        <button class="tag" data-category="fiction">Fiction</button>
        <button class="tag" data-category="non-fiction">Non-Fiction</button>
        <button class="tag" data-category="sci-fi">Sci-Fi</button>
      </div>
    </div>

    <div class="book-grid" id="bookGrid">
      <!-- Dynamic Books Rendered Here -->
    </div>
  </main>

  <!-- Shopping Cart Drawer -->
  <div class="overlay" id="overlay"></div>
  <div class="cart-drawer" id="cartDrawer">
    <div class="cart-header">
      <h3>Your Shopping Cart</h3>
      <button class="close-cart" id="closeCart">&times;</button>
    </div>
    <div class="cart-items" id="cartItems">
      <p style="color: var(--text-muted); text-align: center;">Your cart is currently empty.</p>
    </div>
    <div class="cart-footer">
      <div style="display: flex; justify-content: space-between; font-weight: bold;">
        <span>Total:</span>
        <span id="cartTotal">$0.00</span>
      </div>
      <button class="checkout-btn" onclick="alert('Checkout process initiated!')">Proceed to Checkout</button>
    </div>
  </div>

  <!-- JavaScript Functionality -->
  <script>
    // Sample Data
    const books = [
      { id: 1, title: "The Midnight Library", author: "Matt Haig", price: 18.99, category: "fiction", cover: "https://picsum.photos/seed/book1/300/400" },
      { id: 2, title: "Atomic Habits", author: "James Clear", price: 21.50, category: "non-fiction", cover: "https://picsum.photos/seed/book2/300/400" },
      { id: 3, title: "Dune", author: "Frank Herbert", price: 16.95, category: "sci-fi", cover: "https://picsum.photos/seed/book3/300/400" },
      { id: 4, title: "Project Hail Mary", author: "Andy Weir", price: 19.99, category: "sci-fi", cover: "https://picsum.photos/seed/book4/300/400" },
      { id: 5, title: "Educated", author: "Tara Westover", price: 17.20, category: "non-fiction", cover: "https://picsum.photos/seed/book5/300/400" },
      { id: 6, title: "The Seven Husbands of Evelyn Hugo", author: "Taylor Jenkins Reid", price: 15.99, category: "fiction", cover: "https://picsum.photos/seed/book6/300/400" },
    ];

    let cart = [];

    // DOM Elements
    const bookGrid = document.getElementById('bookGrid');
    const searchInput = document.getElementById('searchInput');
    const filterTags = document.querySelectorAll('.tag');
    const cartDrawer = document.getElementById('cartDrawer');
    const overlay = document.getElementById('overlay');
    const openCartBtn = document.getElementById('openCart');
    const closeCartBtn = document.getElementById('closeCart');
    const cartCount = document.getElementById('cartCount');
    const cartItems = document.getElementById('cartItems');
    const cartTotal = document.getElementById('cartTotal');

    // Render Books
    function renderBooks(filteredBooks) {
      bookGrid.innerHTML = filteredBooks.map(book => `
        <div class="book-card">
          <img src="${book.cover}" alt="${book.title}" class="book-cover" />
          <div class="book-info">
            <h3 class="book-title">${book.title}</h3>
            <p class="book-author">by ${book.author}</p>
            <div class="book-footer">
              <span class="book-price">$${book.price.toFixed(2)}</span>
              <button class="btn-add" onclick="addToCart(${book.id})">Add to Cart</button>
            </div>
          </div>
        </div>
      `).join('');
    }

    // Add to Cart
    function addToCart(id) {
      const book = books.find(b => b.id === id);
      cart.push(book);
      updateCart();
    }

    // Update Cart UI
    function updateCart() {
      cartCount.textContent = cart.length;
      
      if (cart.length === 0) {
        cartItems.innerHTML = '<p style="color: var(--text-muted); text-align: center;">Your cart is currently empty.</p>';
        cartTotal.textContent = '$0.00';
        return;
      }

      cartItems.innerHTML = cart.map((item, index) => `
        <div class="cart-item">
          <div>
            <strong>${item.title}</strong>
            <p style="font-size: 0.85rem; color: var(--text-muted);">$${item.price.toFixed(2)}</p>
          </div>
          <button style="background:none; border:none; color:red; cursor:pointer;" onclick="removeFromCart(${index})">Remove</button>
        </div>
      `).join('');

      const total = cart.reduce((sum, item) => sum + item.price, 0);
      cartTotal.textContent = `$${total.toFixed(2)}`;
    }

    function removeFromCart(index) {
      cart.splice(index, 1);
      updateCart();
    }

    // Filter and Search Logic
    let currentCategory = 'all';

    function filterBooks() {
      const query = searchInput.value.toLowerCase();
      const filtered = books.filter(book => {
        const matchesCategory = currentCategory === 'all' || book.category === currentCategory;
        const matchesSearch = book.title.toLowerCase().includes(query) || book.author.toLowerCase().includes(query);
        return matchesCategory && matchesSearch;
      });
      renderBooks(filtered);
    }

    // Event Listeners
    searchInput.addEventListener('input', filterBooks);

    filterTags.forEach(tag => {
      tag.addEventListener('click', (e) => {
        filterTags.forEach(t => t.classList.remove('active'));
        e.target.classList.add('active');
        currentCategory = e.target.dataset.category;
        filterBooks();
      });
    });

    openCartBtn.addEventListener('click', () => {
      cartDrawer.classList.add('open');
      overlay.classList.add('open');
    });

    closeCartBtn.addEventListener('click', () => {
      cartDrawer.classList.remove('open');
      overlay.classList.remove('open');
    });

    overlay.addEventListener('click', () => {
      cartDrawer.classList.remove('open');
      overlay.classList.remove('open');
    });

    // Initial Render
    renderBooks(books);
  </script>
</body>
</html>

What changed in the prompt

Added a clearer goal by specifying that the website should be an online bookstore instead of simply asking to "Build a website."

What improved in the output

The AI generated a complete bookstore application rather than a generic webpage. It included bookstore-specific features such as book listings, search functionality, category filters, a shopping cart, and checkout interaction, making the website suitable for its intended purpose.

What still failed

The website targets a general audience and doesn't address any specific user group. It also lacks pages such as user login, book details, customer reviews, or order history that are common in full e-commerce websites.

What I would try next

Add a defined audience, such as university students looking for affordable textbooks, so the content and features better match users' needs.



Version 2:


Prompt:
Build an online bookstore website for university students looking for affordable textbooks.


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>CampusBooks — Affordable University Textbooks</title>
  <style>
    :root {
      --primary: #1e3a8a; /* Deep Navy */
      --secondary: #0d9488; /* Teal */
      --accent: #f59e0b; /* Amber */
      --bg: #f8fafc;
      --card-bg: #ffffff;
      --text: #0f172a;
      --text-muted: #64748b;
      --border: #e2e8f0;
      --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.05);
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: system-ui, -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
      background-color: var(--bg);
      color: var(--text);
      line-height: 1.5;
    }

    /* --- Top Banner --- */
    .promo-bar {
      background: var(--accent);
      color: #000;
      font-size: 0.85rem;
      font-weight: 600;
      text-align: center;
      padding: 0.4rem 1rem;
    }

    /* --- Navigation --- */
    header {
      background: var(--card-bg);
      border-bottom: 1px solid var(--border);
      position: sticky;
      top: 0;
      z-index: 100;
    }

    .nav-container {
      max-width: 1200px;
      margin: 0 auto;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 1rem 2rem;
    }

    .logo {
      font-size: 1.4rem;
      font-weight: 800;
      color: var(--primary);
      text-decoration: none;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .cart-btn {
      background: var(--primary);
      color: white;
      border: none;
      padding: 0.5rem 1rem;
      border-radius: 6px;
      cursor: pointer;
      font-weight: 600;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    /* --- Hero --- */
    .hero {
      background: linear-gradient(135deg, #1e3a8a 0%, #0d9488 100%);
      color: white;
      padding: 3.5rem 2rem;
      text-align: center;
    }

    .hero h1 {
      font-size: 2.2rem;
      margin-bottom: 0.8rem;
    }

    .hero p {
      font-size: 1.05rem;
      opacity: 0.9;
      max-width: 600px;
      margin: 0 auto 1.5rem auto;
    }

    .search-box {
      max-width: 550px;
      margin: 0 auto;
      display: flex;
      gap: 0.5rem;
      background: white;
      padding: 0.4rem;
      border-radius: 8px;
    }

    .search-box input {
      flex: 1;
      border: none;
      padding: 0.6rem 0.8rem;
      font-size: 0.95rem;
      outline: none;
    }

    .search-box button {
      background: var(--accent);
      border: none;
      padding: 0.6rem 1.2rem;
      border-radius: 6px;
      font-weight: 700;
      cursor: pointer;
    }

    /* --- Main Layout --- */
    .container {
      max-width: 1200px;
      margin: 2rem auto;
      padding: 0 2rem;
    }

    .filter-bar {
      display: flex;
      gap: 0.5rem;
      margin-bottom: 1.5rem;
      flex-wrap: wrap;
    }

    .filter-btn {
      background: var(--card-bg);
      border: 1px solid var(--border);
      padding: 0.4rem 1rem;
      border-radius: 20px;
      cursor: pointer;
      font-size: 0.85rem;
      font-weight: 500;
    }

    .filter-btn.active {
      background: var(--primary);
      color: white;
      border-color: var(--primary);
    }

    /* --- Book Grid --- */
    .book-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
      gap: 1.5rem;
    }

    .book-card {
      background: var(--card-bg);
      border: 1px solid var(--border);
      border-radius: 8px;
      overflow: hidden;
      box-shadow: var(--shadow);
      display: flex;
      flex-direction: column;
    }

    .badge-wrap {
      position: relative;
    }

    .condition-badge {
      position: absolute;
      top: 10px;
      left: 10px;
      background: rgba(15, 23, 42, 0.85);
      color: white;
      font-size: 0.75rem;
      padding: 0.2rem 0.6rem;
      border-radius: 4px;
      font-weight: 600;
    }

    .book-cover {
      width: 100%;
      height: 220px;
      object-fit: cover;
      background: #e2e8f0;
    }

    .book-details {
      padding: 1rem;
      display: flex;
      flex-direction: column;
      flex-grow: 1;
    }

    .book-title {
      font-size: 1rem;
      font-weight: 700;
      margin-bottom: 0.2rem;
    }

    .book-meta {
      font-size: 0.8rem;
      color: var(--text-muted);
      margin-bottom: 0.8rem;
    }

    .option-selector {
      margin-top: auto;
      margin-bottom: 1rem;
      display: flex;
      gap: 0.5rem;
    }

    .opt-btn {
      flex: 1;
      font-size: 0.75rem;
      padding: 0.3rem;
      border: 1px solid var(--border);
      background: #f1f5f9;
      border-radius: 4px;
      cursor: pointer;
      text-align: center;
    }

    .opt-btn.selected {
      border-color: var(--secondary);
      background: #ccfbf1;
      font-weight: 700;
    }

    .price-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .price {
      font-size: 1.1rem;
      font-weight: 800;
      color: var(--primary);
    }

    .btn-add {
      background: var(--secondary);
      color: white;
      border: none;
      padding: 0.5rem 0.8rem;
      border-radius: 4px;
      font-size: 0.85rem;
      font-weight: 600;
      cursor: pointer;
    }

    /* --- Cart Drawer --- */
    .cart-drawer {
      position: fixed;
      top: 0;
      right: -380px;
      width: 360px;
      height: 100%;
      background: var(--card-bg);
      box-shadow: -4px 0 12px rgba(0,0,0,0.1);
      z-index: 200;
      transition: right 0.3s ease;
      display: flex;
      flex-direction: column;
    }

    .cart-drawer.open {
      right: 0;
    }

    .cart-header {
      padding: 1.2rem;
      border-bottom: 1px solid var(--border);
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .cart-body {
      flex-grow: 1;
      overflow-y: auto;
      padding: 1.2rem;
    }

    .cart-item {
      display: flex;
      justify-content: space-between;
      margin-bottom: 1rem;
      padding-bottom: 0.8rem;
      border-bottom: 1px solid var(--border);
      font-size: 0.9rem;
    }

    .cart-footer {
      padding: 1.2rem;
      border-top: 1px solid var(--border);
    }

    .checkout-btn {
      width: 100%;
      background: var(--primary);
      color: white;
      border: none;
      padding: 0.75rem;
      border-radius: 6px;
      font-weight: 700;
      cursor: pointer;
      margin-top: 0.8rem;
    }

    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(0, 0, 0, 0.4);
      z-index: 150;
      display: none;
    }

    .overlay.open {
      display: block;
    }
  </style>
</head>
<body>

  <div class="promo-bar">🎓 Student Perk: Free semester rental shipping on orders over $45!</div>

  <!-- Header Nav -->
  <header>
    <div class="nav-container">
      <a href="#" class="logo">📖 CampusBooks</a>
      <button class="cart-btn" id="openCart">
        🛒 Cart (<span id="cartCount">0</span>)
      </button>
    </div>
  </header>

  <!-- Hero Section -->
  <section class="hero">
    <h1>Stop Overpaying for Textbooks</h1>
    <p>Rent or buy used STEM, Business, and Humanities textbooks at up to 80% off campus store prices.</p>
    
    <div class="search-box">
      <input type="text" id="searchInput" placeholder="Search by ISBN, Title, or Author (e.g. 978-0134093413)..." />
      <button onclick="filterBooks()">Search</button>
    </div>
  </section>

  <!-- Main Container -->
  <main class="container">
    <div class="filter-bar">
      <button class="filter-btn active" onclick="setCategory('all', this)">All Books</button>
      <button class="filter-btn" onclick="setCategory('STEM', this)">STEM & Computer Science</button>
      <button class="filter-btn" onclick="setCategory('Business', this)">Business & Economics</button>
      <button class="filter-btn" onclick="setCategory('Humanities', this)">Humanities & Arts</button>
    </div>

    <div class="book-grid" id="bookGrid">
      <!-- Dynamic Content -->
    </div>
  </main>

  <!-- Shopping Cart Drawer -->
  <div class="overlay" id="overlay" onclick="closeCartDrawer()"></div>
  <div class="cart-drawer" id="cartDrawer">
    <div class="cart-header">
      <h3>Your Rental & Purchase Cart</h3>
      <button style="background:none; border:none; font-size:1.2rem; cursor:pointer;" onclick="closeCartDrawer()">&times;</button>
    </div>
    <div class="cart-body" id="cartItems">
      <p style="color: var(--text-muted); text-align: center;">Your cart is empty.</p>
    </div>
    <div class="cart-footer">
      <div style="display:flex; justify-content:space-between; font-weight:700;">
        <span>Total:</span>
        <span id="cartTotal">$0.00</span>
      </div>
      <button class="checkout-btn" onclick="alert('Proceeding to Student Checkout...')">Checkout Now</button>
    </div>
  </div>

  <script>
    // Sample Textbook Catalog
    const catalog = [
      {
        id: 1,
        title: "Calculus: Early Transcendentals",
        author: "James Stewart",
        isbn: "978-1285741550",
        category: "STEM",
        condition: "Used - Good",
        rentPrice: 28.50,
        buyPrice: 85.00,
        cover: "https://picsum.photos/seed/calc/300/400"
      },
      {
        id: 2,
        title: "Principles of Economics",
        author: "N. Gregory Mankiw",
        isbn: "978-0357722718",
        category: "Business",
        condition: "Used - Like New",
        rentPrice: 32.00,
        buyPrice: 92.50,
        cover: "https://picsum.photos/seed/econ/300/400"
      },
      {
        id: 3,
        title: "Introduction to Algorithms",
        author: "Cormen, Leiserson, Rivest",
        isbn: "978-0262046305",
        category: "STEM",
        condition: "Digital / eTextbook",
        rentPrice: 24.99,
        buyPrice: 65.00,
        cover: "https://picsum.photos/seed/algo/300/400"
      },
      {
        id: 4,
        title: "Psychology in Everyday Life",
        author: "David G. Myers",
        isbn: "978-1319132101",
        category: "Humanities",
        condition: "Used - Fair",
        rentPrice: 19.99,
        buyPrice: 45.00,
        cover: "https://picsum.photos/seed/psych/300/400"
      }
    ];

    let cart = [];
    let selectedModes = {}; // Tracks Rent vs Buy selection per book
    let activeCategory = 'all';

    // Initialize UI
    function renderBooks(books) {
      const grid = document.getElementById('bookGrid');
      grid.innerHTML = books.map(book => {
        const mode = selectedModes[book.id] || 'rent';
        const price = mode === 'rent' ? book.rentPrice : book.buyPrice;

        return `
          <div class="book-card">
            <div class="badge-wrap">
              <span class="condition-badge">${book.condition}</span>
              <img src="${book.cover}" alt="${book.title}" class="book-cover" />
            </div>
            <div class="book-details">
              <div class="book-title">${book.title}</div>
              <div class="book-meta">${book.author} • ISBN: ${book.isbn}</div>
              
              <div class="option-selector">
                <button class="opt-btn ${mode === 'rent' ? 'selected' : ''}" 
                  onclick="selectOption(${book.id}, 'rent')">Rent (Semester)</button>
                <button class="opt-btn ${mode === 'buy' ? 'selected' : ''}" 
                  onclick="selectOption(${book.id}, 'buy')">Buy Book</button>
              </div>

              <div class="price-row">
                <span class="price">$${price.toFixed(2)}</span>
                <button class="btn-add" onclick="addToCart(${book.id})">Add to Cart</button>
              </div>
            </div>
          </div>
        `;
      }).join('');
    }

    function selectOption(bookId, mode) {
      selectedModes[bookId] = mode;
      filterBooks();
    }

    function addToCart(bookId) {
      const book = catalog.find(b => b.id === bookId);
      const mode = selectedModes[bookId] || 'rent';
      const price = mode === 'rent' ? book.rentPrice : book.buyPrice;

      cart.push({ ...book, selectedMode: mode, itemPrice: price });
      updateCartUI();
    }

    function updateCartUI() {
      document.getElementById('cartCount').textContent = cart.length;
      const cartItems = document.getElementById('cartItems');

      if (cart.length === 0) {
        cartItems.innerHTML = '<p style="color: var(--text-muted); text-align: center;">Your cart is empty.</p>';
        document.getElementById('cartTotal').textContent = '$0.00';
        return;
      }

      cartItems.innerHTML = cart.map((item, index) => `
        <div class="cart-item">
          <div>
            <strong>${item.title}</strong>
            <div style="font-size:0.75rem; color: var(--text-muted);">
              Type: ${item.selectedMode.toUpperCase()} | ${item.condition}
            </div>
            <div style="font-weight:700; margin-top:0.2rem;">$${item.itemPrice.toFixed(2)}</div>
          </div>
          <button style="background:none; border:none; color:red; cursor:pointer;" onclick="removeFromCart(${index})">Remove</button>
        </div>
      `).join('');

      const total = cart.reduce((sum, item) => sum + item.itemPrice, 0);
      document.getElementById('cartTotal').textContent = `$${total.toFixed(2)}`;
    }

    function removeFromCart(index) {
      cart.splice(index, 1);
      updateCartUI();
    }

    function filterBooks() {
      const query = document.getElementById('searchInput').value.toLowerCase();
      const filtered = catalog.filter(book => {
        const matchesCat = activeCategory === 'all' || book.category === activeCategory;
        const matchesQuery = book.title.toLowerCase().includes(query) || 
                             book.author.toLowerCase().includes(query) || 
                             book.isbn.includes(query);
        return matchesCat && matchesQuery;
      });
      renderBooks(filtered);
    }

    function setCategory(cat, btn) {
      activeCategory = cat;
      document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      filterBooks();
    }

    // Cart Drawer Handlers
    document.getElementById('openCart').addEventListener('click', () => {
      document.getElementById('cartDrawer').classList.add('open');
      document.getElementById('overlay').classList.add('open');
    });

    function closeCartDrawer() {
      document.getElementById('cartDrawer').classList.remove('open');
      document.getElementById('overlay').classList.remove('open');
    }

    // Initial Load
    renderBooks(catalog);
  </script>
</body>
</html>

What changed in the prompt

Added a defined audience by specifying that the website is for university students looking for affordable textbooks.

What improved in the output

The website became much more focused on student needs. Instead of displaying general books, it featured textbooks, student discounts, rental options, ISBN search, and academic subject categories. The content, branding, and features were all tailored to university students.

What still failed

The response generated only the website code without explaining its structure or organization. It also lacked additional pages such as user login, order history, or a wishlist.

What I would try next

Add a specified output format so the AI first provides a sitemap or page structure before generating the HTML, CSS, and JavaScript.



Version 3


Prompt:
Build an online bookstore website for university students looking for affordable textbooks. Present the response as a sitemap followed by the complete HTML, CSS, and JavaScript for the website.

Output:
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>UniBooks — Affordable University Textbooks & Rentals</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
  <style>
    /* --- CSS Reset & Custom Properties --- */
    :root {
      --primary: #1e3a8a;
      --primary-light: #3b82f6;
      --primary-dark: #1e293b;
      --accent: #f59e0b;
      --accent-hover: #d97706;
      --secondary: #0d9488;
      --secondary-light: #ccfbf1;
      --bg: #f8fafc;
      --surface: #ffffff;
      --text-main: #0f172a;
      --text-muted: #64748b;
      --border: #e2e8f0;
      --shadow-sm: 0 1px 3px rgba(0,0,0,0.05);
      --shadow-md: 0 4px 6px -1px rgba(0,0,0,0.1), 0 2px 4px -2px rgba(0,0,0,0.05);
      --shadow-lg: 0 10px 15px -3px rgba(0,0,0,0.1), 0 4px 6px -4px rgba(0,0,0,0.1);
      --radius-sm: 6px;
      --radius-md: 10px;
      --radius-lg: 16px;
      --radius-full: 9999px;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'Plus Jakarta Sans', system-ui, -apple-system, sans-serif;
      background-color: var(--bg);
      color: var(--text-main);
      line-height: 1.5;
    }

    /* --- Announcement Bar --- */
    .announcement-bar {
      background: linear-gradient(90deg, #1e3a8a, #0d9488);
      color: #ffffff;
      font-size: 0.85rem;
      font-weight: 600;
      text-align: center;
      padding: 0.5rem 1rem;
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 0.5rem;
    }

    .announcement-bar span {
      background: var(--accent);
      color: #000000;
      padding: 0.15rem 0.5rem;
      border-radius: var(--radius-sm);
      font-size: 0.75rem;
      text-transform: uppercase;
      font-weight: 800;
    }

    /* --- Header & Navigation --- */
    header {
      background: var(--surface);
      border-bottom: 1px solid var(--border);
      position: sticky;
      top: 0;
      z-index: 100;
      box-shadow: var(--shadow-sm);
    }

    .nav-container {
      max-width: 1280px;
      margin: 0 auto;
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 0.9rem 1.5rem;
    }

    .brand {
      display: flex;
      align-items: center;
      gap: 0.6rem;
      text-decoration: none;
      color: var(--primary);
    }

    .brand-logo {
      background: var(--primary);
      color: white;
      width: 40px;
      height: 40px;
      border-radius: var(--radius-md);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.3rem;
      font-weight: 800;
    }

    .brand-name {
      font-size: 1.35rem;
      font-weight: 800;
      letter-spacing: -0.02em;
    }

    .brand-name span {
      color: var(--secondary);
    }

    .nav-links {
      display: flex;
      align-items: center;
      gap: 1.5rem;
      list-style: none;
    }

    .nav-link {
      text-decoration: none;
      color: var(--text-main);
      font-weight: 600;
      font-size: 0.95rem;
      transition: color 0.2s;
      cursor: pointer;
    }

    .nav-link:hover, .nav-link.active {
      color: var(--primary-light);
    }

    .nav-actions {
      display: flex;
      align-items: center;
      gap: 1rem;
    }

    .cart-btn {
      background: #eff6ff;
      color: var(--primary);
      border: 1px solid #bfdbfe;
      padding: 0.55rem 1.1rem;
      border-radius: var(--radius-full);
      font-weight: 700;
      font-size: 0.9rem;
      cursor: pointer;
      display: flex;
      align-items: center;
      gap: 0.5rem;
      transition: all 0.2s;
    }

    .cart-btn:hover {
      background: var(--primary);
      color: white;
      border-color: var(--primary);
    }

    .cart-badge {
      background: var(--accent);
      color: black;
      font-size: 0.75rem;
      font-weight: 800;
      padding: 0.1rem 0.45rem;
      border-radius: var(--radius-full);
    }

    /* --- Views Controller --- */
    .view-section {
      display: none;
    }

    .view-section.active-view {
      display: block;
    }

    /* --- Hero Section --- */
    .hero {
      background: linear-gradient(135deg, #0f172a 0%, #1e3a8a 60%, #0d9488 100%);
      color: white;
      padding: 4rem 1.5rem;
      text-align: center;
      position: relative;
    }

    .hero-content {
      max-width: 800px;
      margin: 0 auto;
    }

    .hero-tag {
      display: inline-block;
      background: rgba(255,255,255,0.15);
      backdrop-filter: blur(8px);
      padding: 0.35rem 1rem;
      border-radius: var(--radius-full);
      font-size: 0.85rem;
      font-weight: 600;
      margin-bottom: 1.2rem;
      border: 1px solid rgba(255,255,255,0.2);
    }

    .hero h1 {
      font-size: 2.75rem;
      font-weight: 800;
      line-height: 1.2;
      margin-bottom: 1rem;
      letter-spacing: -0.03em;
    }

    .hero p {
      font-size: 1.15rem;
      opacity: 0.9;
      margin-bottom: 2rem;
      font-weight: 400;
    }

    /* Search Box */
    .search-box-container {
      max-width: 680px;
      margin: 0 auto;
      background: white;
      padding: 0.5rem;
      border-radius: var(--radius-lg);
      box-shadow: 0 20px 25px -5px rgba(0,0,0,0.2);
      display: flex;
      gap: 0.5rem;
    }

    .search-box-container input {
      flex: 1;
      border: none;
      padding: 0.8rem 1.2rem;
      font-size: 1rem;
      font-family: inherit;
      outline: none;
      color: var(--text-main);
    }

    .search-box-container button {
      background: var(--accent);
      color: #000;
      border: none;
      padding: 0.8rem 1.8rem;
      border-radius: var(--radius-md);
      font-weight: 700;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.2s;
    }

    .search-box-container button:hover {
      background: var(--accent-hover);
    }

    /* --- Features Grid --- */
    .features-strip {
      background: var(--surface);
      border-bottom: 1px solid var(--border);
      padding: 1.5rem 1.5rem;
    }

    .features-container {
      max-width: 1280px;
      margin: 0 auto;
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
      gap: 1.5rem;
    }

    .feature-item {
      display: flex;
      align-items: center;
      gap: 1rem;
    }

    .feature-icon {
      width: 44px;
      height: 44px;
      border-radius: var(--radius-md);
      background: #eff6ff;
      color: var(--primary);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1.3rem;
      flex-shrink: 0;
    }

    .feature-text h4 {
      font-size: 0.95rem;
      font-weight: 700;
    }

    .feature-text p {
      font-size: 0.8rem;
      color: var(--text-muted);
    }

    /* --- Main Layout / Catalogue --- */
    .container {
      max-width: 1280px;
      margin: 2.5rem auto;
      padding: 0 1.5rem;
    }

    .catalog-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 1.5rem;
      flex-wrap: wrap;
      gap: 1rem;
    }

    .section-title {
      font-size: 1.6rem;
      font-weight: 800;
      letter-spacing: -0.02em;
    }

    .filter-pills {
      display: flex;
      gap: 0.5rem;
      flex-wrap: wrap;
    }

    .pill-btn {
      background: var(--surface);
      border: 1px solid var(--border);
      padding: 0.45rem 1.1rem;
      border-radius: var(--radius-full);
      font-size: 0.85rem;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.2s;
      color: var(--text-muted);
    }

    .pill-btn.active, .pill-btn:hover {
      background: var(--primary);
      color: white;
      border-color: var(--primary);
    }

    /* Book Cards Grid */
    .book-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(270px, 1fr));
      gap: 1.75rem;
    }

    .book-card {
      background: var(--surface);
      border: 1px solid var(--border);
      border-radius: var(--radius-lg);
      overflow: hidden;
      box-shadow: var(--shadow-sm);
      display: flex;
      flex-direction: column;
      transition: transform 0.2s, box-shadow 0.2s;
    }

    .book-card:hover {
      transform: translateY(-4px);
      box-shadow: var(--shadow-lg);
    }

    .card-media {
      position: relative;
      height: 220px;
      background: #f1f5f9;
      display: flex;
      align-items: center;
      justify-content: center;
      overflow: hidden;
    }

    .card-media img {
      height: 100%;
      width: 100%;
      object-fit: cover;
    }

    .badge-condition {
      position: absolute;
      top: 10px;
      left: 10px;
      background: rgba(15, 23, 42, 0.85);
      backdrop-filter: blur(4px);
      color: white;
      font-size: 0.72rem;
      font-weight: 700;
      padding: 0.25rem 0.6rem;
      border-radius: var(--radius-sm);
      text-transform: uppercase;
    }

    .badge-savings {
      position: absolute;
      top: 10px;
      right: 10px;
      background: #dc2626;
      color: white;
      font-size: 0.75rem;
      font-weight: 800;
      padding: 0.25rem 0.6rem;
      border-radius: var(--radius-sm);
    }

    .card-body {
      padding: 1.25rem;
      display: flex;
      flex-direction: column;
      flex-grow: 1;
    }

    .book-course {
      font-size: 0.75rem;
      font-weight: 800;
      color: var(--secondary);
      text-transform: uppercase;
      letter-spacing: 0.05em;
      margin-bottom: 0.2rem;
    }

    .book-title {
      font-size: 1.05rem;
      font-weight: 700;
      line-height: 1.3;
      margin-bottom: 0.3rem;
    }

    .book-meta {
      font-size: 0.82rem;
      color: var(--text-muted);
      margin-bottom: 1rem;
    }

    /* Option Selector (Rent vs Buy) */
    .pricing-toggle {
      background: #f1f5f9;
      padding: 0.25rem;
      border-radius: var(--radius-md);
      display: flex;
      gap: 0.25rem;
      margin-bottom: 1rem;
      margin-top: auto;
    }

    .toggle-opt {
      flex: 1;
      border: none;
      background: transparent;
      padding: 0.4rem;
      font-size: 0.78rem;
      font-weight: 600;
      border-radius: var(--radius-sm);
      cursor: pointer;
      color: var(--text-muted);
      transition: all 0.2s;
    }

    .toggle-opt.active {
      background: white;
      color: var(--text-main);
      box-shadow: var(--shadow-sm);
      font-weight: 700;
    }

    .card-footer {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding-top: 0.8rem;
      border-top: 1px solid var(--border);
    }

    .price-display {
      display: flex;
      flex-direction: column;
    }

    .price-amount {
      font-size: 1.25rem;
      font-weight: 800;
      color: var(--primary);
    }

    .price-label {
      font-size: 0.7rem;
      color: var(--text-muted);
    }

    .add-cart-btn {
      background: var(--secondary);
      color: white;
      border: none;
      padding: 0.55rem 1rem;
      border-radius: var(--radius-md);
      font-weight: 700;
      font-size: 0.85rem;
      cursor: pointer;
      transition: background 0.2s;
    }

    .add-cart-btn:hover {
      background: #0f766e;
    }

    /* --- Buyback View Styling --- */
    .buyback-hero {
      background: linear-gradient(135deg, #0f766e 0%, #1e3a8a 100%);
      color: white;
      padding: 3.5rem 1.5rem;
      border-radius: var(--radius-lg);
      margin-bottom: 2rem;
      text-align: center;
    }

    .buyback-grid {
      display: grid;
      grid-template-columns: 1fr 1fr;
      gap: 2rem;
      margin-top: 2rem;
    }

    @media(max-width: 768px) {
      .buyback-grid { grid-template-columns: 1fr; }
    }

    .quote-box {
      background: var(--surface);
      border: 1px solid var(--border);
      border-radius: var(--radius-lg);
      padding: 2rem;
      box-shadow: var(--shadow-sm);
    }

    .form-group {
      margin-bottom: 1.25rem;
    }

    .form-group label {
      display: block;
      font-size: 0.88rem;
      font-weight: 700;
      margin-bottom: 0.4rem;
    }

    .form-group input, .form-group select {
      width: 100%;
      padding: 0.7rem 1rem;
      border: 1px solid var(--border);
      border-radius: var(--radius-md);
      font-family: inherit;
      font-size: 0.95rem;
    }

    .quote-result {
      background: #f0fdf4;
      border: 1px solid #bbf7d0;
      border-radius: var(--radius-md);
      padding: 1.25rem;
      margin-top: 1.5rem;
      display: none;
    }

    .quote-price {
      font-size: 2rem;
      font-weight: 800;
      color: #15803d;
    }

    /* --- Cart Drawer --- */
    .cart-drawer {
      position: fixed;
      top: 0;
      right: -420px;
      width: 400px;
      height: 100%;
      background: var(--surface);
      box-shadow: -10px 0 25px rgba(0,0,0,0.15);
      z-index: 200;
      transition: right 0.3s cubic-bezier(0.16, 1, 0.3, 1);
      display: flex;
      flex-direction: column;
    }

    .cart-drawer.open {
      right: 0;
    }

    .cart-header {
      padding: 1.25rem 1.5rem;
      border-bottom: 1px solid var(--border);
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .cart-header h3 {
      font-size: 1.1rem;
      font-weight: 800;
    }

    .close-btn {
      background: none;
      border: none;
      font-size: 1.5rem;
      cursor: pointer;
      color: var(--text-muted);
    }

    .cart-body {
      flex: 1;
      overflow-y: auto;
      padding: 1.5rem;
    }

    .cart-item {
      display: flex;
      justify-content: space-between;
      gap: 1rem;
      padding-bottom: 1rem;
      margin-bottom: 1rem;
      border-bottom: 1px solid var(--border);
    }

    .cart-item-title {
      font-weight: 700;
      font-size: 0.92rem;
    }

    .cart-item-meta {
      font-size: 0.78rem;
      color: var(--text-muted);
      margin-top: 0.2rem;
    }

    .cart-footer {
      padding: 1.5rem;
      border-top: 1px solid var(--border);
      background: #f8fafc;
    }

    .cart-summary-row {
      display: flex;
      justify-content: space-between;
      margin-bottom: 0.5rem;
      font-size: 0.9rem;
    }

    .cart-summary-row.total {
      font-weight: 800;
      font-size: 1.15rem;
      color: var(--text-main);
      border-top: 1px solid var(--border);
      padding-top: 0.5rem;
      margin-top: 0.5rem;
    }

    .checkout-btn {
      width: 100%;
      background: var(--primary);
      color: white;
      border: none;
      padding: 0.85rem;
      border-radius: var(--radius-md);
      font-weight: 700;
      font-size: 1rem;
      cursor: pointer;
      margin-top: 1rem;
      transition: background 0.2s;
    }

    .checkout-btn:hover {
      background: #1d4ed8;
    }

    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: rgba(15, 23, 42, 0.5);
      backdrop-filter: blur(2px);
      z-index: 150;
      display: none;
    }

    .overlay.open {
      display: block;
    }

    /* Simple Footer */
    footer {
      background: #0f172a;
      color: white;
      padding: 3rem 1.5rem;
      margin-top: 4rem;
    }

    .footer-container {
      max-width: 1280px;
      margin: 0 auto;
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 2rem;
    }

    .footer-col h4 {
      font-size: 1rem;
      font-weight: 700;
      margin-bottom: 1rem;
      color: var(--secondary-light);
    }

    .footer-col ul {
      list-style: none;
    }

    .footer-col ul li {
      margin-bottom: 0.5rem;
    }

    .footer-col ul li a {
      color: #94a3b8;
      text-decoration: none;
      font-size: 0.88rem;
    }

    .footer-col ul li a:hover {
      color: white;
    }

    .copyright {
      text-align: center;
      padding-top: 2rem;
      margin-top: 2rem;
      border-top: 1px solid #1e293b;
      color: #64748b;
      font-size: 0.82rem;
    }
  </style>
</head>
<body>

  <!-- Top Announcement -->
  <div class="announcement-bar">
    <span>STUDENT SPECIAL</span> Save up to 85% with semester rentals + Free shipping on orders over $45!
  </div>

  <!-- Header -->
  <header>
    <div class="nav-container">
      <a href="#" class="brand" onclick="switchView('catalog')">
        <div class="brand-logo">U</div>
        <div class="brand-name">Uni<span>Books</span></div>
      </a>

      <ul class="nav-links">
        <li><a class="nav-link active" id="nav-catalog" onclick="switchView('catalog')">Find Textbooks</a></li>
        <li><a class="nav-link" id="nav-buyback" onclick="switchView('buyback')">Sell / Trade Back</a></li>
        <li><a class="nav-link" id="nav-faq" onclick="switchView('faq')">Student FAQ</a></li>
      </ul>

      <div class="nav-actions">
        <button class="cart-btn" id="openCartBtn">
          🛒 Cart
          <span class="cart-badge" id="cartCount">0</span>
        </button>
      </div>
    </div>
  </header>

  <!-- VIEW 1: CATALOG / HOME -->
  <div id="view-catalog" class="view-section active-view">
    <!-- Hero Banner -->
    <section class="hero">
      <div class="hero-content">
        <span class="hero-tag">🎓 Trusted by 100,000+ Students</span>
        <h1>Stop Overpaying for Campus Textbooks</h1>
        <p>Rent or buy certified used textbooks, eTextbooks, and study guides with instant price comparisons.</p>
        
        <div class="search-box-container">
          <input type="text" id="searchInput" placeholder="Enter ISBN-13, Title, Author, or Course (e.g., CS101, Stewart)..." />
          <button onclick="handleSearch()">Search Books</button>
        </div>
      </div>
    </section>

    <!-- Value Props Strip -->
    <div class="features-strip">
      <div class="features-container">
        <div class="feature-item">
          <div class="feature-icon">🚚</div>
          <div class="feature-text">
            <h4>Fast Campus Delivery</h4>
            <p>Free 2-day shipping to dorms or campus lockers.</p>
          </div>
        </div>
        <div class="feature-item">
          <div class="feature-icon">🔄</div>
          <div class="feature-text">
            <h4>21-Day Risk-Free Returns</h4>
            <p>Dropped a class? Return for a 100% full refund.</p>
          </div>
        </div>
        <div class="feature-item">
          <div class="feature-icon">💰</div>
          <div class="feature-text">
            <h4>Guaranteed Buyback</h4>
            <p>We lock in your trade-in value before finals.</p>
          </div>
        </div>
      </div>
    </div>

    <!-- Catalog Main -->
    <main class="container">
      <div class="catalog-header">
        <h2 class="section-title" id="catalogTitle">Popular Textbooks for Fall Semester</h2>
        <div class="filter-pills">
          <button class="pill-btn active" onclick="filterCategory('all', this)">All Subjects</button>
          <button class="pill-btn" onclick="filterCategory('STEM', this)">STEM & Tech</button>
          <button class="pill-btn" onclick="filterCategory('Business', this)">Business & Econ</button>
          <button class="pill-btn" onclick="filterCategory('Humanities', this)">Humanities</button>
          <button class="pill-btn" onclick="filterCategory('Health', this)">Medical & Health</button>
        </div>
      </div>

      <div class="book-grid" id="bookGrid">
        <!-- Dynamic Book Cards Injected Here -->
      </div>
    </main>
  </div>

  <!-- VIEW 2: SELL / BUYBACK -->
  <div id="view-buyback" class="view-section">
    <main class="container">
      <div class="buyback-hero">
        <h1>Turn Your Used Textbooks Into Fast Cash</h1>
        <p style="opacity:0.9; margin-top:0.5rem;">Get an instant cash quote and free prepaid shipping label to send your books back.</p>
      </div>

      <div class="buyback-grid">
        <div class="quote-box">
          <h3 style="font-size:1.3rem; margin-bottom:1rem;">Get an Instant Buyback Quote</h3>
          <form id="buybackForm" onsubmit="calculateBuyback(event)">
            <div class="form-group">
              <label for="isbnInput">Book ISBN-13 Number</label>
              <input type="text" id="isbnInput" placeholder="e.g. 978-1285741550" required />
            </div>
            <div class="form-group">
              <label for="conditionSelect">Book Condition</label>
              <select id="conditionSelect">
                <option value="good">Good (Minor highlights, clean spine)</option>
                <option value="like-new">Like New (No writing, sharp corners)</option>
                <option value="acceptable">Acceptable (Heavy wear, readable)</option>
              </select>
            </div>
            <button type="submit" class="checkout-btn" style="background:var(--secondary);">Get Quote</button>
          </form>

          <div class="quote-result" id="quoteResult">
            <p style="font-size:0.85rem; color:#166534; font-weight:700;">OFFER VALID FOR 14 DAYS</p>
            <div style="margin: 0.5rem 0;">Cash Offer: <span class="quote-price" id="quoteAmount">$0.00</span></div>
            <p style="font-size:0.8rem; color:#166534; margin-bottom:1rem;">Includes free prepaid shipping label!</p>
            <button class="checkout-btn" onclick="alert('Trade-in shipping label generated! Check your email.')">Accept Offer & Print Label</button>
          </div>
        </div>

        <div>
          <h3 style="font-size:1.3rem; margin-bottom:1rem;">How Book Trade-In Works</h3>
          <div style="display:flex; gap:1rem; margin-bottom:1.5rem;">
            <div style="background:#e0f2fe; color:#0369a1; width:36px; height:36px; border-radius:50%; display:flex; align-items:center; justify-content:center; font-weight:800; flex-shrink:0;">1</div>
            <div>
              <h4 style="font-size:0.95rem; font-weight:700;">Enter your ISBN</h4>
              <p style="font-size:0.85rem; color:var(--text-muted);">Find the 13-digit barcode on the back cover of your textbook.</p>
            </div>
          </div>
          <div style="display:flex; gap:1rem; margin-bottom:1.5rem;">
            <div style="background:#e0f2fe; color:#0369a1; width:36px; height:36px; border-radius:50%; display:flex; align-items:center; justify-content:center; font-weight:800; flex-shrink:0;">2</div>
            <div>
              <h4 style="font-size:0.95rem; font-weight:700;">Print Prepaid Label</h4>
              <p style="font-size:0.85rem; color:var(--text-muted);">Pack your books in any cardboard box and slap on our free shipping label.</p>
            </div>
          </div>
          <div style="display:flex; gap:1rem;">
            <div style="background:#e0f2fe; color:#0369a1; width:36px; height:36px; border-radius:50%; display:flex; align-items:center; justify-content:center; font-weight:800; flex-shrink:0;">3</div>
            <div>
              <h4 style="font-size:0.95rem; font-weight:700;">Get Paid Fast</h4>
              <p style="font-size:0.85rem; color:var(--text-muted);">Payouts are issued via PayPal or Direct Deposit within 2 days of receiving your box.</p>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>

  <!-- VIEW 3: FAQ -->
  <div id="view-faq" class="view-section">
    <main class="container" style="max-width:800px;">
      <h2 class="section-title" style="margin-bottom:1.5rem; text-align:center;">Frequently Asked Questions</h2>
      
      <div style="background:white; padding:1.5rem; border-radius:var(--radius-lg); border:1px solid var(--border); margin-bottom:1rem;">
        <h3 style="font-size:1.05rem; font-weight:700; color:var(--primary); margin-bottom:0.4rem;">How do textbook rentals work?</h3>
        <p style="font-size:0.9rem; color:var(--text-muted);">Choose the "Rent (Semester)" option on any textbook card. We'll ship the physical book to you. At the end of finals week, put it in the box, attach the prepaid return label we provide, and drop it off at UPS.</p>
      </div>

      <div style="background:white; padding:1.5rem; border-radius:var(--radius-lg); border:1px solid var(--border); margin-bottom:1rem;">
        <h3 style="font-size:1.05rem; font-weight:700; color:var(--primary); margin-bottom:0.4rem;">Can I highlight in rental books?</h3>
        <p style="font-size:0.9rem; color:var(--text-muted);">Yes! Reasonable highlighting and note-taking are permitted in rental textbooks. Just ensure no pages are missing or water-damaged.</p>
      </div>

      <div style="background:white; padding:1.5rem; border-radius:var(--radius-lg); border:1px solid var(--border); margin-bottom:1rem;">
        <h3 style="font-size:1.05rem; font-weight:700; color:var(--primary); margin-bottom:0.4rem;">What if I drop my course?</h3>
        <p style="font-size:0.9rem; color:var(--text-muted);">We offer a 21-day full refund policy from the start of the semester. Return the book within 21 days for a 100% refund on the rental fee.</p>
      </div>
    </main>
  </div>

  <!-- SHOPPING CART DRAWER -->
  <div class="overlay" id="overlay" onclick="toggleCart(false)"></div>
  <div class="cart-drawer" id="cartDrawer">
    <div class="cart-header">
      <h3>Your Rental & Order Cart</h3>
      <button class="close-btn" onclick="toggleCart(false)">&times;</button>
    </div>
    <div class="cart-body" id="cartItemsContainer">
      <!-- Dynamic Cart Items -->
    </div>
    <div class="cart-footer">
      <div class="cart-summary-row">
        <span>Subtotal</span>
        <span id="subtotalAmount">$0.00</span>
      </div>
      <div class="cart-summary-row">
        <span>Estimated Shipping</span>
        <span id="shippingAmount">FREE</span>
      </div>
      <div class="cart-summary-row total">
        <span>Total</span>
        <span id="totalAmount">$0.00</span>
      </div>
      <button class="checkout-btn" onclick="processCheckout()">Proceed to Student Checkout</button>
    </div>
  </div>

  <!-- FOOTER -->
  <footer>
    <div class="footer-container">
      <div class="footer-col">
        <h4>UniBooks</h4>
        <p style="font-size:0.85rem; color:#94a3b8; line-height:1.6;">Making higher education affordable by eliminating overpriced textbook fees.</p>
      </div>
      <div class="footer-col">
        <h4>Student Services</h4>
        <ul>
          <li><a href="#" onclick="switchView('catalog')">Rent Textbooks</a></li>
          <li><a href="#" onclick="switchView('buyback')">Sell Textbooks</a></li>
          <li><a href="#" onclick="switchView('catalog')">eTextbooks</a></li>
        </ul>
      </div>
      <div class="footer-col">
        <h4>Support & Guarantees</h4>
        <ul>
          <li><a href="#" onclick="switchView('faq')">21-Day Return Policy</a></li>
          <li><a href="#" onclick="switchView('faq')">Shipping Guidelines</a></li>
          <li><a href="#" onclick="switchView('faq')">Help Center</a></li>
        </ul>
      </div>
    </div>
    <div class="copyright">
      &copy; 2026 UniBooks Inc. All rights reserved. Designed for university students everywhere.
    </div>
  </footer>

  <!-- JAVASCRIPT LOGIC -->
  <script>
    // Sample Textbook Catalog Data
    const catalogData = [
      {
        id: 1,
        title: "Calculus: Early Transcendentals",
        author: "James Stewart",
        isbn: "978-1285741550",
        category: "STEM",
        course: "MATH 201",
        condition: "Used - Good",
        savings: "SAVE 78%",
        rentPrice: 28.50,
        buyPrice: 85.00,
        cover: "https://images.unsplash.com/photo-1543002588-bfa74002ed7e?auto=format&fit=crop&w=400&q=80"
      },
      {
        id: 2,
        title: "Principles of Economics (9th Ed)",
        author: "N. Gregory Mankiw",
        isbn: "978-0357722718",
        category: "Business",
        course: "ECON 101",
        condition: "Used - Like New",
        savings: "SAVE 70%",
        rentPrice: 32.00,
        buyPrice: 94.50,
        cover: "https://images.unsplash.com/photo-1589829085413-56de8ae18c73?auto=format&fit=crop&w=400&q=80"
      },
      {
        id: 3,
        title: "Introduction to Algorithms (4th Ed)",
        author: "Cormen, Leiserson, Rivest",
        isbn: "978-0262046305",
        category: "STEM",
        course: "CS 301",
        condition: "eTextbook / Digital",
        savings: "SAVE 65%",
        rentPrice: 24.99,
        buyPrice: 65.00,
        cover: "https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=400&q=80"
      },
      {
        id: 4,
        title: "Campbell Biology (12th Edition)",
        author: "Urry, Cain, Wasserman",
        isbn: "978-0135188743",
        category: "STEM",
        course: "BIOL 110",
        condition: "Used - Good",
        savings: "SAVE 82%",
        rentPrice: 35.00,
        buyPrice: 110.00,
        cover: "https://images.unsplash.com/photo-1532012197267-da84d127e765?auto=format&fit=crop&w=400&q=80"
      },
      {
        id: 5,
        title: "Psychology in Everyday Life",
        author: "David G. Myers",
        isbn: "978-1319132101",
        category: "Humanities",
        course: "PSYC 100",
        condition: "Used - Fair",
        savings: "SAVE 75%",
        rentPrice: 19.99,
        buyPrice: 42.00,
        cover: "https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?auto=format&fit=crop&w=400&q=80"
      },
      {
        id: 6,
        title: "Anatomy & Physiology (6th Ed)",
        author: "Kenneth Saladin",
        isbn: "978-1260212211",
        category: "Health",
        course: "NURS 202",
        condition: "Used - Like New",
        savings: "SAVE 68%",
        rentPrice: 38.00,
        buyPrice: 115.00,
        cover: "https://images.unsplash.com/photo-1576091160399-112ba8d25d1d?auto=format&fit=crop&w=400&q=80"
      }
    ];

    // State Variables
    let cart = [];
    let selectedModes = {}; // Stores rent/buy toggle selection per book ID
    let currentCategory = 'all';

    // RENDER CATALOG
    function renderCatalog(books) {
      const grid = document.getElementById('bookGrid');
      
      if (books.length === 0) {
        grid.innerHTML = `<div style="grid-column: 1/-1; text-align:center; padding:3rem; color:var(--text-muted);">
          <h3>No textbooks found matching your search.</h3>
          <p style="margin-top:0.5rem;">Try searching by ISBN or general course name like "CS101".</p>
        </div>`;
        return;
      }

      grid.innerHTML = books.map(book => {
        const mode = selectedModes[book.id] || 'rent';
        const displayPrice = mode === 'rent' ? book.rentPrice : book.buyPrice;

        return `
          <div class="book-card">
            <div class="card-media">
              <span class="badge-condition">${book.condition}</span>
              <span class="badge-savings">${book.savings}</span>
              <img src="${book.cover}" alt="${book.title}" />
            </div>
            <div class="card-body">
              <div class="book-course">${book.course} • ${book.category}</div>
              <h3 class="book-title">${book.title}</h3>
              <p class="book-meta">By ${book.author}<br>ISBN: ${book.isbn}</p>

              <div class="pricing-toggle">
                <button class="toggle-opt ${mode === 'rent' ? 'active' : ''}" 
                  onclick="setBookMode(${book.id}, 'rent')">Rent ($${book.rentPrice.toFixed(2)})</button>
                <button class="toggle-opt ${mode === 'buy' ? 'active' : ''}" 
                  onclick="setBookMode(${book.id}, 'buy')">Buy ($${book.buyPrice.toFixed(2)})</button>
              </div>

              <div class="card-footer">
                <div class="price-display">
                  <span class="price-amount">$${displayPrice.toFixed(2)}</span>
                  <span class="price-label">${mode === 'rent' ? 'Semester Rental' : 'Owned Outright'}</span>
                </div>
                <button class="add-cart-btn" onclick="addToCart(${book.id})">+ Cart</button>
              </div>
            </div>
          </div>
        `;
      }).join('');
    }

    // TOGGLE RENT VS BUY
    function setBookMode(bookId, mode) {
      selectedModes[bookId] = mode;
      filterBooks();
    }

    // CART OPERATIONS
    function addToCart(bookId) {
      const book = catalogData.find(b => b.id === bookId);
      const mode = selectedModes[bookId] || 'rent';
      const price = mode === 'rent' ? book.rentPrice : book.buyPrice;

      cart.push({
        cartItemId: Date.now(),
        bookId: book.id,
        title: book.title,
        mode: mode,
        price: price,
        isbn: book.isbn
      });

      updateCartUI();
      toggleCart(true);
    }

    function removeFromCart(cartItemId) {
      cart = cart.filter(item => item.cartItemId !== cartItemId);
      updateCartUI();
    }

    function updateCartUI() {
      document.getElementById('cartCount').textContent = cart.length;
      const container = document.getElementById('cartItemsContainer');

      if (cart.length === 0) {
        container.innerHTML = `<div style="text-align:center; padding:3rem 0; color:var(--text-muted);">
          <p style="font-size:1.2rem; margin-bottom:0.5rem;">🛒</p>
          <p>Your cart is empty.</p>
        </div>`;
        document.getElementById('subtotalAmount').textContent = '$0.00';
        document.getElementById('totalAmount').textContent = '$0.00';
        return;
      }

      container.innerHTML = cart.map(item => `
        <div class="cart-item">
          <div>
            <div class="cart-item-title">${item.title}</div>
            <div class="cart-item-meta">Option: ${item.mode.toUpperCase()} • ISBN: ${item.isbn}</div>
            <div style="font-weight:800; color:var(--primary); margin-top:0.3rem;">$${item.price.toFixed(2)}</div>
          </div>
          <button style="background:none; border:none; color:#ef4444; font-size:0.8rem; cursor:pointer; font-weight:700;" 
            onclick="removeFromCart(${item.cartItemId})">Remove</button>
        </div>
      `).join('');

      const subtotal = cart.reduce((sum, item) => sum + item.price, 0);
      document.getElementById('subtotalAmount').textContent = `$${subtotal.toFixed(2)}`;
      document.getElementById('totalAmount').textContent = `$${subtotal.toFixed(2)}`;
    }

    function toggleCart(open) {
      const drawer = document.getElementById('cartDrawer');
      const overlay = document.getElementById('overlay');
      if (open) {
        drawer.classList.add('open');
        overlay.classList.add('open');
      } else {
        drawer.classList.remove('open');
        overlay.classList.remove('open');
      }
    }

    function processCheckout() {
      if (cart.length === 0) return alert('Your cart is empty.');
      alert('Order placed successfully! Order confirmation sent to student email.');
      cart = [];
      updateCartUI();
      toggleCart(false);
    }

    // FILTERING & SEARCH
    function filterBooks() {
      const query = document.getElementById('searchInput').value.toLowerCase().trim();
      
      const filtered = catalogData.filter(book => {
        const matchesCategory = currentCategory === 'all' || book.category === currentCategory;
        const matchesQuery = book.title.toLowerCase().includes(query) ||
                             book.author.toLowerCase().includes(query) ||
                             book.isbn.includes(query) ||
                             book.course.toLowerCase().includes(query);
        return matchesCategory && matchesQuery;
      });

      renderCatalog(filtered);
    }

    function filterCategory(cat, btn) {
      currentCategory = cat;
      document.querySelectorAll('.pill-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      filterBooks();
    }

    function handleSearch() {
      filterBooks();
    }

    document.getElementById('searchInput').addEventListener('keyup', (e) => {
      filterBooks();
    });

    // NAVIGATION / VIEWS SWITCHER
    function switchView(viewName) {
      document.querySelectorAll('.view-section').forEach(v => v.classList.remove('active-view'));
      document.querySelectorAll('.nav-link').forEach(l => l.classList.remove('active'));

      document.getElementById(`view-${viewName}`).classList.add('active-view');
      document.getElementById(`nav-${viewName}`).classList.add('active');
      window.scrollTo(0, 0);
    }

    // BUYBACK QUOTE SIMULATOR
    function calculateBuyback(e) {
      e.preventDefault();
      const isbn = document.getElementById('isbnInput').value;
      const condition = document.getElementById('conditionSelect').value;
      
      // Pseudo calculation based on input string length and condition
      let baseVal = 25.00 + (isbn.length % 5) * 4;
      if (condition === 'like-new') baseVal *= 1.3;
      if (condition === 'acceptable') baseVal *= 0.7;

      document.getElementById('quoteAmount').textContent = `$${baseVal.toFixed(2)}`;
      document.getElementById('quoteResult').style.display = 'block';
    }

    // INITIAL RENDER
    document.getElementById('openCartBtn').addEventListener('click', () => toggleCart(true));
    renderCatalog(catalogData);
  </script>
</body>
</html>

What changed in the prompt

Added a specified output format by asking for a sitemap followed by the complete HTML, CSS, and JavaScript.

What improved in the output

The response became much better organized. Instead of providing only a single webpage, it followed a logical website structure with separate sections for the catalog, textbook buyback, and FAQs. This made the website easier to understand and navigate.

What still failed

The AI did not actually provide a separate sitemap before the code as requested. It jumped directly into generating the website, so it did not fully follow the requested output format.

What I would try next

Add quality criteria, such as requiring a responsive layout, accessible design, and modern UI components.


Version 4

Prompt:
Build an online bookstore website for university students looking for affordable textbooks. Present the response as a sitemap followed by the complete HTML, CSS, and JavaScript for the website. Use a responsive layout, accessible color contrast, consistent spacing, modern typography, and clear call-to-action buttons.


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>UniBooks | Affordable University Textbooks</title>
  <style>
    /* ==========================================================================
       1. CSS VARIABLES & RESET (Accessible Contrast & Design Tokens)
       ========================================================================== */
    :root {
      --primary-navy: #0F172A;     /* Deep navy for strong readability */
      --primary-blue: #1E40AF;     /* WCAG AA compliant blue */
      --accent-green: #15803D;     /* Accessible green for savings/deals */
      --accent-hover: #166534;
      --bg-light: #F8FAFC;         /* Soft background */
      --surface-white: #FFFFFF;
      --text-main: #0F172A;
      --text-muted: #475569;
      --border-color: #CBD5E1;
      --radius-sm: 6px;
      --radius-md: 12px;
      --shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -2px rgba(0, 0, 0, 0.05);
      --font-stack: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: var(--font-stack);
      background-color: var(--bg-light);
      color: var(--text-main);
      line-height: 1.5;
    }

    /* Accessibility Focus Rings */
    a:focus-visible, button:focus-visible, input:focus-visible {
      outline: 3px solid var(--primary-blue);
      outline-offset: 2px;
    }

    /* ==========================================================================
       2. HEADER & NAVIGATION
       ========================================================================== */
    header {
      background-color: var(--surface-white);
      border-bottom: 1px solid var(--border-color);
      position: sticky;
      top: 0;
      z-index: 100;
    }

    .nav-container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 1rem 1.5rem;
      display: flex;
      align-items: center;
      justify-content: space-between;
      gap: 1.5rem;
    }

    .logo {
      font-size: 1.5rem;
      font-weight: 800;
      color: var(--primary-blue);
      text-decoration: none;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .logo span {
      color: var(--accent-green);
    }

    .search-bar {
      flex: 1;
      max-width: 500px;
      position: relative;
    }

    .search-bar input {
      width: 100%;
      padding: 0.75rem 1rem;
      border: 2px solid var(--border-color);
      border-radius: var(--radius-sm);
      font-size: 0.95rem;
    }

    .search-bar input:focus {
      border-color: var(--primary-blue);
    }

    .nav-actions {
      display: flex;
      align-items: center;
      gap: 1rem;
    }

    .btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      padding: 0.65rem 1.25rem;
      font-size: 0.95rem;
      font-weight: 600;
      border-radius: var(--radius-sm);
      cursor: pointer;
      border: none;
      transition: background-color 0.2s ease, transform 0.1s ease;
      text-decoration: none;
    }

    .btn-primary {
      background-color: var(--primary-blue);
      color: var(--surface-white);
    }

    .btn-primary:hover {
      background-color: #1E3A8A;
    }

    .btn-secondary {
      background-color: transparent;
      color: var(--primary-navy);
      border: 2px solid var(--border-color);
    }

    .btn-secondary:hover {
      background-color: #E2E8F0;
    }

    .btn-accent {
      background-color: var(--accent-green);
      color: var(--surface-white);
    }

    .btn-accent:hover {
      background-color: var(--accent-hover);
    }

    .cart-btn {
      position: relative;
      background: none;
      border: none;
      font-size: 1.5rem;
      cursor: pointer;
      padding: 0.5rem;
      color: var(--primary-navy);
    }

    .cart-badge {
      position: absolute;
      top: 0;
      right: 0;
      background-color: var(--accent-green);
      color: white;
      font-size: 0.75rem;
      font-weight: bold;
      border-radius: 50%;
      width: 20px;
      height: 20px;
      display: flex;
      align-items: center;
      justify-content: center;
    }

    /* ==========================================================================
       3. HERO SECTION
       ========================================================================== */
    .hero {
      background: linear-gradient(135deg, var(--primary-navy) 0%, #1E293B 100%);
      color: var(--surface-white);
      padding: 4rem 1.5rem;
      text-align: center;
    }

    .hero-content {
      max-width: 800px;
      margin: 0 auto;
    }

    .hero h1 {
      font-size: 2.75rem;
      font-weight: 800;
      line-height: 1.2;
      margin-bottom: 1rem;
    }

    .hero p {
      font-size: 1.2rem;
      color: #94A3B8;
      margin-bottom: 2rem;
    }

    .hero-cta {
      display: flex;
      gap: 1rem;
      justify-content: center;
      flex-wrap: wrap;
    }

    /* ==========================================================================
       4. MAIN CATALOG & FILTERS
       ========================================================================== */
    main {
      max-width: 1200px;
      margin: 3rem auto;
      padding: 0 1.5rem;
    }

    .section-header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 1.5rem;
      flex-wrap: wrap;
      gap: 1rem;
    }

    .filter-group {
      display: flex;
      gap: 0.5rem;
      background-color: #E2E8F0;
      padding: 0.25rem;
      border-radius: var(--radius-sm);
    }

    .filter-btn {
      padding: 0.5rem 1rem;
      border: none;
      background: none;
      font-weight: 600;
      color: var(--text-muted);
      cursor: pointer;
      border-radius: var(--radius-sm);
    }

    .filter-btn.active {
      background-color: var(--surface-white);
      color: var(--primary-navy);
      box-shadow: var(--shadow);
    }

    .book-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
      gap: 2rem;
    }

    .book-card {
      background-color: var(--surface-white);
      border: 1px solid var(--border-color);
      border-radius: var(--radius-md);
      overflow: hidden;
      box-shadow: var(--shadow);
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      transition: transform 0.2s ease;
    }

    .book-card:hover {
      transform: translateY(-4px);
    }

    .book-cover {
      height: 220px;
      background-color: #E2E8F0;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 3rem;
      position: relative;
    }

    .badge {
      position: absolute;
      top: 10px;
      left: 10px;
      padding: 0.25rem 0.6rem;
      font-size: 0.75rem;
      font-weight: 700;
      border-radius: 4px;
      text-transform: uppercase;
    }

    .badge-rent { background-color: #DBEAFE; color: #1E40AF; }
    .badge-used { background-color: #FEF3C7; color: #92400E; }
    .badge-ebook { background-color: #DCFCE7; color: #166534; }

    .book-details {
      padding: 1.25rem;
      flex: 1;
      display: flex;
      flex-direction: column;
    }

    .book-title {
      font-size: 1.1rem;
      font-weight: 700;
      margin-bottom: 0.25rem;
      line-height: 1.3;
    }

    .book-author {
      font-size: 0.875rem;
      color: var(--text-muted);
      margin-bottom: 1rem;
    }

    .book-pricing {
      margin-top: auto;
      margin-bottom: 1rem;
      display: flex;
      align-items: baseline;
      gap: 0.5rem;
    }

    .price-current {
      font-size: 1.35rem;
      font-weight: 800;
      color: var(--accent-green);
    }

    .price-original {
      font-size: 0.9rem;
      color: var(--text-muted);
      text-decoration: line-through;
    }

    /* ==========================================================================
       5. SLIDE-OVER CART DRAWER
       ========================================================================== */
    .cart-drawer {
      position: fixed;
      top: 0;
      right: -400px;
      width: 100%;
      max-width: 400px;
      height: 100vh;
      background-color: var(--surface-white);
      box-shadow: -4px 0 15px rgba(0, 0, 0, 0.15);
      z-index: 200;
      transition: right 0.3s ease-in-out;
      display: flex;
      flex-direction: column;
    }

    .cart-drawer.open {
      right: 0;
    }

    .cart-header {
      padding: 1.5rem;
      border-bottom: 1px solid var(--border-color);
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .cart-body {
      padding: 1.5rem;
      flex: 1;
      overflow-y: auto;
    }

    .cart-item {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 1rem;
      padding-bottom: 1rem;
      border-bottom: 1px solid var(--border-color);
    }

    .cart-footer {
      padding: 1.5rem;
      border-top: 1px solid var(--border-color);
      background-color: var(--bg-light);
    }

    .overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
      background: rgba(0, 0, 0, 0.5);
      z-index: 150;
      display: none;
    }

    .overlay.active {
      display: block;
    }

    /* ==========================================================================
       6. FOOTER
       ========================================================================== */
    footer {
      background-color: var(--primary-navy);
      color: var(--surface-white);
      padding: 3rem 1.5rem 1.5rem;
      margin-top: 5rem;
    }

    .footer-grid {
      max-width: 1200px;
      margin: 0 auto;
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 2rem;
      margin-bottom: 2rem;
    }

    .footer-col h4 {
      margin-bottom: 1rem;
      font-size: 1.1rem;
    }

    .footer-col ul {
      list-style: none;
    }

    .footer-col ul li {
      margin-bottom: 0.5rem;
    }

    .footer-col a {
      color: #94A3B8;
      text-decoration: none;
    }

    .footer-col a:hover {
      color: var(--surface-white);
    }

    .footer-bottom {
      max-width: 1200px;
      margin: 0 auto;
      text-align: center;
      padding-top: 1.5rem;
      border-top: 1px solid #334155;
      color: #94A3B8;
      font-size: 0.875rem;
    }

    /* Responsive adjustments */
    @media (max-width: 768px) {
      .nav-container { flex-direction: column; }
      .search-bar { width: 100%; }
      .hero h1 { font-size: 2rem; }
    }
  </style>
</head>
<body>

  <!-- Navigation Bar -->
  <header>
    <div class="nav-container">
      <a href="#" class="logo">
        📖 UniBooks <span>Save80%</span>
      </a>
      
      <div class="search-bar">
        <input 
          type="text" 
          id="searchInput" 
          placeholder="Search by Title, Author, ISBN, or Course Code (e.g., CS101)..." 
          aria-label="Search textbooks"
        />
      </div>

      <div class="nav-actions">
        <a href="#sell" class="btn btn-secondary">Sell Textbooks</a>
        <button class="cart-btn" id="openCartBtn" aria-label="View Shopping Cart">
          🛒 <span class="cart-badge" id="cartCount">0</span>
        </button>
      </div>
    </div>
  </header>

  <!-- Hero Section -->
  <section class="hero">
    <div class="hero-content">
      <h1>Stop Overpaying for University Textbooks</h1>
      <p>Rent, buy cheap used copies, or instantly access e-books. Built by students, for students.</p>
      <div class="hero-cta">
        <a href="#catalog" class="btn btn-accent">Browse Deals</a>
        <a href="#sell" class="btn btn-secondary" style="color: white; border-color: #475569;">Calculate Buyback Value</a>
      </div>
    </div>
  </section>

  <!-- Main Catalog Section -->
  <main id="catalog">
    <div class="section-header">
      <h2>Popular Required Textbooks</h2>
      
      <div class="filter-group" role="tablist" aria-label="Format Filter">
        <button class="filter-btn active" data-filter="all">All</button>
        <button class="filter-btn" data-filter="rent">Rentals</button>
        <button class="filter-btn" data-filter="used">Used Print</button>
        <button class="filter-btn" data-filter="ebook">E-Books</button>
      </div>
    </div>

    <div class="book-grid" id="bookGrid">
      <!-- Dynamic Rendering via JavaScript -->
    </div>
  </main>

  <!-- Shopping Cart Slide-over -->
  <div class="overlay" id="overlay"></div>
  <aside class="cart-drawer" id="cartDrawer" aria-label="Shopping Cart">
    <div class="cart-header">
      <h3>Your Book Bag</h3>
      <button class="btn btn-secondary" id="closeCartBtn" style="padding: 0.25rem 0.5rem;">✕</button>
    </div>
    <div class="cart-body" id="cartItems">
      <p style="color: var(--text-muted); text-align: center;">Your bag is currently empty.</p>
    </div>
    <div class="cart-footer">
      <div style="display: flex; justify-content: space-between; font-weight: bold; margin-bottom: 1rem;">
        <span>Total:</span>
        <span id="cartTotal">$0.00</span>
      </div>
      <button class="btn btn-accent" style="width: 100%;">Proceed to Checkout</button>
    </div>
  </aside>

  <!-- Footer -->
  <footer>
    <div class="footer-grid">
      <div class="footer-col">
        <h4>UniBooks</h4>
        <p style="color: #94A3B8;">Making higher education affordable for everyone.</p>
      </div>
      <div class="footer-col">
        <h4>Student Services</h4>
        <ul>
          <li><a href="#">Textbook Rental Return</a></li>
          <li><a href="#">Sell Back Your Books</a></li>
          <li><a href="#">E-book Access Code Help</a></li>
        </ul>
      </div>
      <div class="footer-col">
        <h4>Popular Majors</h4>
        <ul>
          <li><a href="#">Computer Science & STEM</a></li>
          <li><a href="#">Business & Economics</a></li>
          <li><a href="#">Nursing & Medicine</a></li>
        </ul>
      </div>
    </div>
    <div class="footer-bottom">
      <p>&copy; 2026 UniBooks Technologies Inc. Designed with WCAG 2.1 AA Accessibility Standards.</p>
    </div>
  </footer>

  <!-- JavaScript Functionality -->
  <script>
    // Mock Book Data
    const books = [
      {
        id: 1,
        title: "Calculus: Early Transcendentals",
        author: "James Stewart",
        format: "rent",
        badgeText: "Semester Rental",
        badgeClass: "badge-rent",
        price: 29.99,
        originalPrice: 249.99,
        icon: "📐"
      },
      {
        id: 2,
        title: "Introduction to Algorithms (4th Ed)",
        author: "Cormen, Leiserson, Rivest",
        format: "used",
        badgeText: "Used (Good)",
        badgeClass: "badge-used",
        price: 45.50,
        originalPrice: 110.00,
        icon: "💻"
      },
      {
        id: 3,
        title: "Principles of Economics",
        author: "N. Gregory Mankiw",
        format: "ebook",
        badgeText: "Instant PDF",
        badgeClass: "badge-ebook",
        price: 19.99,
        originalPrice: 130.00,
        icon: "📊"
      },
      {
        id: 4,
        title: "Organic Chemistry",
        author: "Paula Yurkanis Bruice",
        format: "rent",
        badgeText: "Semester Rental",
        badgeClass: "badge-rent",
        price: 34.99,
        originalPrice: 280.00,
        icon: "🧪"
      },
      {
        id: 5,
        title: "Psychology in Everyday Life",
        author: "David G. Myers",
        format: "used",
        badgeText: "Used (Acceptable)",
        badgeClass: "badge-used",
        price: 14.99,
        originalPrice: 95.00,
        icon: "🧠"
      },
      {
        id: 6,
        title: "Campbell Biology (12th Ed)",
        author: "Lisa A. Urry",
        format: "ebook",
        badgeText: "Instant eTextbook",
        badgeClass: "badge-ebook",
        price: 24.99,
        originalPrice: 190.00,
        icon: "🧬"
      }
    ];

    let cart = [];

    // DOM Elements
    const bookGrid = document.getElementById('bookGrid');
    const filterBtns = document.querySelectorAll('.filter-btn');
    const searchInput = document.getElementById('searchInput');
    const cartDrawer = document.getElementById('cartDrawer');
    const overlay = document.getElementById('overlay');
    const openCartBtn = document.getElementById('openCartBtn');
    const closeCartBtn = document.getElementById('closeCartBtn');
    const cartCountEl = document.getElementById('cartCount');
    const cartItemsEl = document.getElementById('cartItems');
    const cartTotalEl = document.getElementById('cartTotal');

    // Render Books
    function renderBooks(items) {
      bookGrid.innerHTML = '';
      if (items.length === 0) {
        bookGrid.innerHTML = `<p style="grid-column: 1/-1; text-align: center; color: var(--text-muted);">No textbooks found matching your criteria.</p>`;
        return;
      }

      items.forEach(book => {
        const card = document.createElement('article');
        card.className = 'book-card';
        card.innerHTML = `
          <div class="book-cover">
            ${book.icon}
            <span class="badge ${book.badgeClass}">${book.badgeText}</span>
          </div>
          <div class="book-details">
            <h3 class="book-title">${book.title}</h3>
            <p class="book-author">by ${book.author}</p>
            <div class="book-pricing">
              <span class="price-current">$${book.price.toFixed(2)}</span>
              <span class="price-original">$${book.originalPrice.toFixed(2)}</span>
            </div>
            <button class="btn btn-primary" style="width: 100%;" onclick="addToCart(${book.id})">
              Add to Bag
            </button>
          </div>
        `;
        bookGrid.appendChild(card);
      });
    }

    // Filter Functionality
    filterBtns.forEach(btn => {
      btn.addEventListener('click', () => {
        filterBtns.forEach(b => b.classList.remove('active'));
        btn.classList.add('active');
        const filter = btn.getAttribute('data-filter');
        
        if (filter === 'all') {
          renderBooks(books);
        } else {
          const filtered = books.filter(b => b.format === filter);
          renderBooks(filtered);
        }
      });
    });

    // Search Functionality
    searchInput.addEventListener('input', (e) => {
      const query = e.target.value.toLowerCase();
      const filtered = books.filter(book => 
        book.title.toLowerCase().includes(query) || 
        book.author.toLowerCase().includes(query)
      );
      renderBooks(filtered);
    });

    // Cart Management
    window.addToCart = function(id) {
      const book = books.find(b => b.id === id);
      cart.push(book);
      updateCartUI();
      openCart();
    };

    function updateCartUI() {
      cartCountEl.textContent = cart.length;
      
      if (cart.length === 0) {
        cartItemsEl.innerHTML = `<p style="color: var(--text-muted); text-align: center;">Your bag is currently empty.</p>`;
        cartTotalEl.textContent = '$0.00';
        return;
      }

      cartItemsEl.innerHTML = '';
      let total = 0;

      cart.forEach((item, index) => {
        total += item.price;
        const itemEl = document.createElement('div');
        itemEl.className = 'cart-item';
        itemEl.innerHTML = `
          <div>
            <strong style="display:block; font-size: 0.9rem;">${item.title}</strong>
            <small style="color: var(--text-muted);">$${item.price.toFixed(2)} (${item.badgeText})</small>
          </div>
          <button onclick="removeFromCart(${index})" style="background: none; border: none; color: #DC2626; cursor: pointer; font-weight: bold;">Remove</button>
        `;
        cartItemsEl.appendChild(itemEl);
      });

      cartTotalEl.textContent = `$${total.toFixed(2)}`;
    }

    window.removeFromCart = function(index) {
      cart.splice(index, 1);
      updateCartUI();
    };

    // Drawer Controls
    function openCart() {
      cartDrawer.classList.add('open');
      overlay.classList.add('active');
    }

    function closeCart() {
      cartDrawer.classList.remove('open');
      overlay.classList.remove('active');
    }

    openCartBtn.addEventListener('click', openCart);
    closeCartBtn.addEventListener('click', closeCart);
    overlay.addEventListener('click', closeCart);

    // Initial Render
    renderBooks(books);
  </script>
</body>
</html>

What changed in the prompt


Added a clear output structure requirement by asking the AI to provide a sitemap first and then generate the complete HTML, CSS, and JavaScript code.
Added more direction about the expected website sections, including the textbook catalog, selling/buyback system, and FAQ area.
Made the prompt more specific about the type of website being built, helping the AI understand the purpose, users, and required features.


What improved in the output


The generated website became more organized and closer to a real product website rather than a simple webpage.
The output included important e-commerce elements such as:
textbook listings
search functionality
filters
shopping cart interaction
pricing displays
student-focused sections
The design quality improved with:
better color choices
responsive layout
accessibility considerations
cleaner navigation
reusable CSS variables
The code structure became easier to maintain because HTML, CSS, and JavaScript responsibilities were separated more clearly.


What still failed


The AI still did not completely follow the requested response format because it generated the full webpage without first showing a separate sitemap.
Some requested business features were only simulated:
no user accounts
no payment integration
no real textbook inventory system
deployment readiness.

What I would try next
Ask for production-level features
Add stricter instructions about the delivery format

Version 5 (final)

Prompt

Create a complete production-style website for a university textbook marketplace called UniBooks.

Before writing any code, provide a clear website sitemap that explains the main pages, sections, and user flow.

After the sitemap, generate the complete implementation using:

HTML5 for semantic structure
CSS3 for a modern responsive design
JavaScript for interactive functionality

The website should allow students to:

search textbooks by title, author, ISBN, or course code
browse textbooks by category and format
rent textbooks
buy used textbooks
access e-books
add books to a shopping cart
view cart totals
remove items from the cart
sell or calculate buyback value for textbooks

Required pages/sections:

Homepage
strong hero section
student-focused messaging
call-to-action buttons
Textbook Catalog
searchable book cards
filters for rental, used books, and e-books
pricing comparison showing savings
Sell Textbooks Section
textbook buyback information
estimated value calculator interface
FAQ Section
common student questions
rental, payment, and e-book support information
Footer
student services
popular majors
contact/support links

Design requirements:

modern university technology style
clean professional layout
mobile-first responsive design
accessible color contrast
WCAG 2.1 AA principles
keyboard-friendly navigation
clear focus states
readable typography
reusable CSS variables/components

JavaScript requirements:

dynamic textbook rendering
working search
working filters
functional cart drawer
cart count updates
total price calculation
empty cart handling

Code quality requirements:

write clean, organized, maintainable code
include comments explaining major sections
avoid unnecessary libraries
use realistic sample textbook data
ensure the final output can run by saving it as a single HTML file

Output:
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>UniBooks | Affordable University Textbooks, Rentals & Buyback</title>

  <style>
    /* ==========================================================================
       1. CSS VARIABLES & DESIGN TOKENS (WCAG 2.1 AA Compliant)
       ========================================================================== */
    :root {
      /* Brand Palette (Sufficient Contrast Ratio > 4.5:1) */
      --color-navy: #0F172A;        /* Header, Dark Hero, Footer */
      --color-blue-primary: #1D4ED8;/* Primary CTAs, Active States */
      --color-blue-hover: #1E40AF;  /* Hover States */
      --color-green-accent: #15803D;/* Savings, Success Elements */
      --color-green-light: #DCFCE7; /* Badges Background */
      --color-amber-accent: #B45309;/* Used Books Badge Text */
      --color-amber-light: #FEF3C7; /* Used Books Badge BG */
      --color-purple-accent: #6B21A8;/* E-Book Badge Text */
      --color-purple-light: #F3E8FF;/* E-Book Badge BG */
      
      /* Neutral Tones */
      --color-bg-main: #F8FAFC;     /* Body Background */
      --color-surface: #FFFFFF;     /* Cards, Drawers */
      --color-border: #CBD5E1;      /* Input & Card Borders */
      --color-text-main: #0F172A;   /* Primary Reading Text */
      --color-text-muted: #475569;  /* Secondary Subtitles */
      --color-text-light: #64748B;  /* Captions */

      /* Layout & Utility Variables */
      --radius-sm: 6px;
      --radius-md: 12px;
      --radius-lg: 16px;
      --shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
      --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -2px rgba(0, 0, 0, 0.05);
      --shadow-lg: 0 10px 25px -5px rgba(0, 0, 0, 0.15);
      --transition-fast: 0.2s ease;
      --font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif;
    }

    /* ==========================================================================
       2. BASE & ACCESSIBILITY STYLES
       ========================================================================== */
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    html {
      scroll-behavior: smooth;
    }

    body {
      font-family: var(--font-family);
      background-color: var(--color-bg-main);
      color: var(--text-main);
      line-height: 1.6;
      font-size: 1rem;
    }

    /* Clear Focus States for Keyboard Accessibility (WCAG) */
    a:focus-visible, 
    button:focus-visible, 
    input:focus-visible, 
    select:focus-visible {
      outline: 3px solid var(--color-blue-primary);
      outline-offset: 3px;
    }

    .container {
      max-width: 1200px;
      margin: 0 auto;
      padding: 0 1.5rem;
    }

    h1, h2, h3, h4 {
      line-height: 1.25;
      color: var(--color-navy);
      font-weight: 800;
    }

    /* Buttons Component */
    .btn {
      display: inline-flex;
      align-items: center;
      justify-content: center;
      gap: 0.5rem;
      padding: 0.75rem 1.5rem;
      font-size: 1rem;
      font-weight: 600;
      border-radius: var(--radius-sm);
      cursor: pointer;
      border: 2px solid transparent;
      transition: background-color var(--transition-fast), border-color var(--transition-fast), transform var(--transition-fast);
      text-decoration: none;
    }

    .btn:active {
      transform: scale(0.98);
    }

    .btn-primary {
      background-color: var(--color-blue-primary);
      color: #FFFFFF;
    }

    .btn-primary:hover {
      background-color: var(--color-blue-hover);
    }

    .btn-secondary {
      background-color: transparent;
      color: var(--color-navy);
      border-color: var(--color-border);
    }

    .btn-secondary:hover {
      background-color: #E2E8F0;
    }

    .btn-accent {
      background-color: var(--color-green-accent);
      color: #FFFFFF;
    }

    .btn-accent:hover {
      background-color: #166534;
    }

    /* ==========================================================================
       3. HEADER & NAVIGATION
       ========================================================================== */
    header {
      background-color: var(--color-surface);
      border-bottom: 1px solid var(--color-border);
      position: sticky;
      top: 0;
      z-index: 90;
    }

    .nav-wrapper {
      display: flex;
      align-items: center;
      justify-content: space-between;
      padding: 1rem 1.5rem;
      gap: 1.5rem;
    }

    .brand-logo {
      font-size: 1.5rem;
      font-weight: 900;
      color: var(--color-navy);
      text-decoration: none;
      display: flex;
      align-items: center;
      gap: 0.5rem;
    }

    .brand-logo span {
      color: var(--color-blue-primary);
    }

    .global-search {
      flex: 1;
      max-width: 480px;
      position: relative;
    }

    .global-search input {
      width: 100%;
      padding: 0.75rem 1rem 0.75rem 2.5rem;
      border: 2px solid var(--color-border);
      border-radius: var(--radius-sm);
      font-size: 0.95rem;
      background-color: var(--color-bg-main);
    }

    .global-search input:focus {
      background-color: var(--color-surface);
      border-color: var(--color-blue-primary);
    }

    .global-search .search-icon {
      position: absolute;
      left: 0.85rem;
      top: 50%;
      transform: translateY(-50%);
      color: var(--color-text-light);
      pointer-events: none;
    }

    .nav-links {
      display: flex;
      align-items: center;
      gap: 1.5rem;
      list-style: none;
    }

    .nav-links a {
      color: var(--color-text-main);
      text-decoration: none;
      font-weight: 600;
      font-size: 0.95rem;
    }

    .nav-links a:hover {
      color: var(--color-blue-primary);
    }

    .cart-trigger {
      position: relative;
      background: none;
      border: none;
      font-size: 1.5rem;
      cursor: pointer;
      padding: 0.5rem;
      color: var(--color-navy);
      border-radius: var(--radius-sm);
    }

    .cart-badge {
      position: absolute;
      top: 0;
      right: 0;
      background-color: var(--color-green-accent);
      color: #FFFFFF;
      font-size: 0.75rem;
      font-weight: 800;
      border-radius: 999px;
      min-width: 22px;
      height: 22px;
      display: flex;
      align-items: center;
      justify-content: center;
      padding: 0 4px;
    }

    /* ==========================================================================
       4. HERO SECTION
       ========================================================================== */
    .hero {
      background: linear-gradient(135deg, var(--color-navy) 0%, #1E293B 100%);
      color: #FFFFFF;
      padding: 5rem 1.5rem;
      text-align: center;
    }

    .hero-content {
      max-width: 800px;
      margin: 0 auto;
    }

    .hero h1 {
      color: #FFFFFF;
      font-size: clamp(2.2rem, 5vw, 3.5rem);
      margin-bottom: 1.25rem;
      letter-spacing: -0.02em;
    }

    .hero p {
      font-size: 1.2rem;
      color: #94A3B8;
      margin-bottom: 2rem;
    }

    .hero-actions {
      display: flex;
      gap: 1rem;
      justify-content: center;
      flex-wrap: wrap;
    }

    .hero .btn-secondary {
      color: #FFFFFF;
      border-color: #475569;
    }

    .hero .btn-secondary:hover {
      background-color: rgba(255, 255, 255, 0.1);
    }

    /* ==========================================================================
       5. FEATURE HIGHLIGHTS
       ========================================================================== */
    .features-bar {
      background-color: var(--color-surface);
      border-bottom: 1px solid var(--color-border);
      padding: 2rem 0;
    }

    .features-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
      gap: 2rem;
    }

    .feature-item {
      display: flex;
      align-items: flex-start;
      gap: 1rem;
    }

    .feature-icon {
      font-size: 2rem;
      background-color: #EFF6FF;
      padding: 0.5rem;
      border-radius: var(--radius-sm);
      line-height: 1;
    }

    /* ==========================================================================
       6. TEXTBOOK CATALOG SECTION
       ========================================================================== */
    .catalog-section {
      padding: 4rem 0;
    }

    .catalog-header {
      display: flex;
      justify-content: space-between;
      align-items: flex-end;
      margin-bottom: 2rem;
      flex-wrap: wrap;
      gap: 1.5rem;
    }

    .filter-tabs {
      display: flex;
      background-color: #E2E8F0;
      padding: 0.3rem;
      border-radius: var(--radius-sm);
      gap: 0.25rem;
      flex-wrap: wrap;
    }

    .filter-tab {
      padding: 0.5rem 1rem;
      border: none;
      background: transparent;
      font-weight: 600;
      font-size: 0.9rem;
      color: var(--color-text-muted);
      cursor: pointer;
      border-radius: var(--radius-sm);
      transition: all var(--transition-fast);
    }

    .filter-tab.active {
      background-color: var(--color-surface);
      color: var(--color-navy);
      box-shadow: var(--shadow-sm);
    }

    .book-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(270px, 1fr));
      gap: 2rem;
    }

    .book-card {
      background-color: var(--color-surface);
      border: 1px solid var(--color-border);
      border-radius: var(--radius-md);
      overflow: hidden;
      box-shadow: var(--shadow-sm);
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      transition: transform var(--transition-fast), box-shadow var(--transition-fast);
    }

    .book-card:hover {
      transform: translateY(-4px);
      box-shadow: var(--shadow-md);
    }

    .book-cover {
      height: 200px;
      background-color: #F1F5F9;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 4rem;
      position: relative;
      border-bottom: 1px solid var(--color-border);
    }

    .badge {
      position: absolute;
      top: 12px;
      left: 12px;
      padding: 0.3rem 0.6rem;
      font-size: 0.75rem;
      font-weight: 800;
      border-radius: var(--radius-sm);
      text-transform: uppercase;
      letter-spacing: 0.03em;
    }

    .badge-rent { background-color: #DBEAFE; color: var(--color-blue-primary); }
    .badge-used { background-color: var(--color-amber-light); color: var(--color-amber-accent); }
    .badge-ebook { background-color: var(--color-purple-light); color: var(--color-purple-accent); }

    .book-info {
      padding: 1.25rem;
      flex: 1;
      display: flex;
      flex-direction: column;
    }

    .book-course {
      font-size: 0.75rem;
      font-weight: 700;
      color: var(--color-blue-primary);
      text-transform: uppercase;
      margin-bottom: 0.25rem;
    }

    .book-title {
      font-size: 1.1rem;
      margin-bottom: 0.35rem;
    }

    .book-author {
      font-size: 0.875rem;
      color: var(--color-text-muted);
      margin-bottom: 0.75rem;
    }

    .book-isbn {
      font-size: 0.75rem;
      color: var(--color-text-light);
      margin-bottom: 1.25rem;
    }

    .book-pricing {
      margin-top: auto;
      margin-bottom: 1rem;
      display: flex;
      align-items: baseline;
      gap: 0.6rem;
    }

    .price-current {
      font-size: 1.4rem;
      font-weight: 800;
      color: var(--color-green-accent);
    }

    .price-original {
      font-size: 0.9rem;
      color: var(--color-text-light);
      text-decoration: line-through;
    }

    .price-savings {
      font-size: 0.75rem;
      font-weight: 700;
      background-color: var(--color-green-light);
      color: var(--color-green-accent);
      padding: 0.15rem 0.4rem;
      border-radius: 4px;
    }

    /* ==========================================================================
       7. SELL TEXTBOOKS & BUYBACK CALCULATOR
       ========================================================================== */
    .sell-section {
      background-color: #EFF6FF;
      border-top: 1px solid var(--color-border);
      border-bottom: 1px solid var(--color-border);
      padding: 4rem 0;
    }

    .sell-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
      gap: 3rem;
      align-items: center;
    }

    .calculator-card {
      background-color: var(--color-surface);
      padding: 2rem;
      border-radius: var(--radius-md);
      box-shadow: var(--shadow-md);
      border: 1px solid var(--color-border);
    }

    .calculator-card h3 {
      margin-bottom: 1.25rem;
    }

    .form-group {
      margin-bottom: 1.25rem;
    }

    .form-group label {
      display: block;
      font-weight: 700;
      font-size: 0.9rem;
      margin-bottom: 0.4rem;
    }

    .form-group input, 
    .form-group select {
      width: 100%;
      padding: 0.75rem;
      border: 2px solid var(--color-border);
      border-radius: var(--radius-sm);
      font-size: 1rem;
    }

    .buyback-result {
      margin-top: 1.5rem;
      padding: 1rem;
      background-color: var(--color-green-light);
      border: 1px solid var(--color-green-accent);
      border-radius: var(--radius-sm);
      display: none;
    }

    .buyback-result.active {
      display: block;
    }

    /* ==========================================================================
       8. FAQ SECTION ACCORDION
       ========================================================================== */
    .faq-section {
      padding: 4rem 0;
    }

    .faq-container {
      max-width: 800px;
      margin: 2rem auto 0;
    }

    .faq-item {
      background-color: var(--color-surface);
      border: 1px solid var(--color-border);
      border-radius: var(--radius-sm);
      margin-bottom: 1rem;
      overflow: hidden;
    }

    .faq-trigger {
      width: 100%;
      text-align: left;
      padding: 1.25rem;
      background: none;
      border: none;
      font-size: 1.05rem;
      font-weight: 700;
      color: var(--color-navy);
      display: flex;
      justify-content: space-between;
      align-items: center;
      cursor: pointer;
    }

    .faq-trigger::after {
      content: '+';
      font-size: 1.5rem;
      line-height: 1;
      color: var(--color-blue-primary);
    }

    .faq-item.active .faq-trigger::after {
      content: '−';
    }

    .faq-content {
      padding: 0 1.25rem 1.25rem;
      color: var(--color-text-muted);
      display: none;
    }

    .faq-item.active .faq-content {
      display: block;
    }

    /* ==========================================================================
       9. SHOPPING BAG SLIDE-OVER DRAWER
       ========================================================================== */
    .drawer-overlay {
      position: fixed;
      top: 0;
      left: 0;
      width: 100vw;
      height: 100vh;
      background-color: rgba(15, 23, 42, 0.6);
      z-index: 100;
      opacity: 0;
      pointer-events: none;
      transition: opacity var(--transition-fast);
    }

    .drawer-overlay.active {
      opacity: 1;
      pointer-events: auto;
    }

    .cart-drawer {
      position: fixed;
      top: 0;
      right: 0;
      width: 100%;
      max-width: 420px;
      height: 100vh;
      background-color: var(--color-surface);
      box-shadow: var(--shadow-lg);
      z-index: 101;
      transform: translateX(100%);
      transition: transform 0.3s cubic-bezier(0.16, 1, 0.3, 1);
      display: flex;
      flex-direction: column;
    }

    .cart-drawer.active {
      transform: translateX(0);
    }

    .drawer-header {
      padding: 1.25rem 1.5rem;
      border-bottom: 1px solid var(--color-border);
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .drawer-close {
      background: none;
      border: none;
      font-size: 1.5rem;
      cursor: pointer;
      color: var(--color-text-muted);
      padding: 0.25rem;
    }

    .drawer-body {
      padding: 1.5rem;
      flex: 1;
      overflow-y: auto;
    }

    .cart-item {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      padding-bottom: 1rem;
      margin-bottom: 1rem;
      border-bottom: 1px solid var(--color-border);
    }

    .cart-item-title {
      font-weight: 700;
      font-size: 0.95rem;
      margin-bottom: 0.2rem;
    }

    .cart-item-meta {
      font-size: 0.8rem;
      color: var(--color-text-muted);
    }

    .cart-item-price {
      font-weight: 800;
      color: var(--color-green-accent);
    }

    .cart-item-remove {
      background: none;
      border: none;
      color: #DC2626;
      font-size: 0.8rem;
      font-weight: 700;
      cursor: pointer;
      margin-top: 0.4rem;
      padding: 0;
    }

    .drawer-footer {
      padding: 1.5rem;
      border-top: 1px solid var(--color-border);
      background-color: var(--color-bg-main);
    }

    .summary-row {
      display: flex;
      justify-content: space-between;
      margin-bottom: 0.5rem;
      font-size: 0.95rem;
    }

    .summary-total {
      font-size: 1.25rem;
      font-weight: 800;
      color: var(--color-navy);
      border-top: 1px solid var(--color-border);
      padding-top: 0.5rem;
      margin-top: 0.5rem;
    }

    /* ==========================================================================
       10. FOOTER
       ========================================================================== */
    footer {
      background-color: var(--color-navy);
      color: #FFFFFF;
      padding: 4rem 0 2rem;
    }

    .footer-grid {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
      gap: 2.5rem;
      margin-bottom: 3rem;
    }

    .footer-col h4 {
      color: #FFFFFF;
      font-size: 1.1rem;
      margin-bottom: 1.25rem;
    }

    .footer-col ul {
      list-style: none;
    }

    .footer-col ul li {
      margin-bottom: 0.6rem;
    }

    .footer-col a {
      color: #94A3B8;
      text-decoration: none;
      font-size: 0.9rem;
    }

    .footer-col a:hover {
      color: #FFFFFF;
    }

    .footer-bottom {
      border-top: 1px solid #334155;
      padding-top: 2rem;
      text-align: center;
      color: #94A3B8;
      font-size: 0.85rem;
    }

    /* ==========================================================================
       11. RESPONSIVE MEDIA QUERIES
       ========================================================================== */
    @media (max-width: 768px) {
      .nav-wrapper {
        flex-wrap: wrap;
      }

      .global-search {
        order: 3;
        max-width: 100%;
        width: 100%;
      }

      .nav-links {
        gap: 1rem;
      }

      .hero {
        padding: 3rem 1rem;
      }

      .catalog-header {
        flex-direction: column;
        align-items: flex-start;
      }

      .filter-tabs {
        width: 100%;
        overflow-x: auto;
      }
    }
  </style>
</head>
<body>

  <!-- 1. GLOBAL NAVIGATION -->
  <header>
    <div class="container nav-wrapper">
      <a href="#" class="brand-logo" aria-label="UniBooks Home">
        📚 Uni<span>Books</span>
      </a>

      <div class="global-search">
        <span class="search-icon" aria-hidden="true">🔍</span>
        <input 
          type="text" 
          id="searchInput" 
          placeholder="Search by Title, Author, ISBN, or Course (e.g. CS101)..." 
          aria-label="Search textbooks by title, author, ISBN, or course code"
        />
      </div>

      <nav>
        <ul class="nav-links">
          <li><a href="#catalog">Catalog</a></li>
          <li><a href="#sell">Sell Books</a></li>
          <li><a href="#faq">FAQ</a></li>
          <li>
            <button class="cart-trigger" id="openCartBtn" aria-label="Open shopping bag">
              🛒
              <span class="cart-badge" id="cartBadgeCount">0</span>
            </button>
          </li>
        </ul>
      </nav>
    </div>
  </header>

  <!-- 2. HERO SECTION -->
  <section class="hero">
    <div class="hero-content">
      <h1>University Textbooks for a Fraction of the Price</h1>
      <p>Save up to 85% by renting, buying cheap used print editions, or downloading instant e-books directly for your semester.</p>
      <div class="hero-actions">
        <a href="#catalog" class="btn btn-accent">Explore Textbooks</a>
        <a href="#sell" class="btn btn-secondary">Sell Used Books</a>
      </div>
    </div>
  </section>

  <!-- 3. PLATFORM FEATURES BAR -->
  <section class="features-bar" aria-label="Platform Highlights">
    <div class="container">
      <div class="features-grid">
        <div class="feature-item">
          <div class="feature-icon" aria-hidden="true">⚡</div>
          <div>
            <h4>Instant E-Book Access</h4>
            <p style="font-size: 0.875rem; color: var(--color-text-muted);">Read immediately on tablet, desktop, or mobile.</p>
          </div>
        </div>
        <div class="feature-item">
          <div class="feature-icon" aria-hidden="true">📦</div>
          <div>
            <h4>Free Return Shipping</h4>
            <p style="font-size: 0.875rem; color: var(--color-text-muted);">Prepaid labels provided for all semester rentals.</p>
          </div>
        </div>
        <div class="feature-item">
          <div class="feature-icon" aria-hidden="true">💰</div>
          <div>
            <h4>Buyback Guarantee</h4>
            <p style="font-size: 0.875rem; color: var(--color-text-muted);">Get cash quotes back at finals time.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 4. TEXTBOOK CATALOG SECTION -->
  <main class="container catalog-section" id="catalog">
    <div class="catalog-header">
      <div>
        <h2>Required Course Textbooks</h2>
        <p style="color: var(--color-text-muted);">Real-time pricing comparison across multiple student formats.</p>
      </div>

      <!-- Format Filter Tabs -->
      <div class="filter-tabs" role="tablist" aria-label="Filter books by format">
        <button class="filter-tab active" data-filter="all" role="tab" aria-selected="true">All Formats</button>
        <button class="filter-tab" data-filter="rent" role="tab" aria-selected="false">Rentals</button>
        <button class="filter-tab" data-filter="used" role="tab" aria-selected="false">Used Print</button>
        <button class="filter-tab" data-filter="ebook" role="tab" aria-selected="false">E-Books</button>
      </div>
    </div>

    <!-- Product Grid Container -->
    <div class="book-grid" id="bookGrid" aria-live="polite">
      <!-- Injected via JavaScript -->
    </div>
  </main>

  <!-- 5. SELL & BUYBACK SECTION -->
  <section class="sell-section" id="sell">
    <div class="container">
      <div class="sell-grid">
        <div>
          <h2>Need Fast Cash? Sell Your Textbooks Back</h2>
          <p style="margin: 1rem 0 1.5rem; color: var(--color-text-muted);">
            Don't let expensive books gather dust after final exams. Enter your textbook's ISBN to receive an instant cash quote and a free prepaid shipping label.
          </p>
          <ul style="margin-left: 1.25rem; color: var(--color-text-muted); font-size: 0.95rem;">
            <li style="margin-bottom: 0.5rem;">Instant locked-in pricing for 14 days</li>
            <li style="margin-bottom: 0.5rem;">Free shipping label provided</li>
            <li style="margin-bottom: 0.5rem;">Payment via PayPal, Venmo, or Direct Deposit</li>
          </ul>
        </div>

        <!-- Buyback Calculator Interface -->
        <div class="calculator-card">
          <h3>Calculate Buyback Quote</h3>
          <form id="buybackForm" onsubmit="event.preventDefault(); calculateBuyback();">
            <div class="form-group">
              <label for="buybackIsbn">Textbook ISBN-13</label>
              <input type="text" id="buybackIsbn" placeholder="e.g. 9780134685991" required />
            </div>

            <div class="form-group">
              <label for="bookCondition">Book Condition</label>
              <select id="bookCondition">
                <option value="1.0">Like New / Unused</option>
                <option value="0.85" selected>Good (Minor Shelf Wear)</option>
                <option value="0.65">Acceptable (Highlighting / Wear)</option>
              </select>
            </div>

            <button type="submit" class="btn btn-primary" style="width: 100%;">Estimate Buyback Value</button>
          </form>

          <div class="buyback-result" id="buybackResult">
            <p style="font-size: 0.875rem; color: var(--color-green-accent); font-weight: 700;">Estimated Cash Offer:</p>
            <p id="buybackPrice" style="font-size: 2rem; font-weight: 900; color: var(--color-green-accent);">$0.00</p>
            <button class="btn btn-accent" style="width: 100%; margin-top: 0.75rem; font-size: 0.875rem;">Accept Offer & Print Label</button>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 6. FAQ SECTION -->
  <section class="faq-section" id="faq">
    <div class="container">
      <h2 style="text-align: center;">Frequently Asked Questions</h2>
      <p style="text-align: center; color: var(--color-text-muted);">Everything you need to know about campus rentals, e-books, and returns.</p>

      <div class="faq-container">
        <div class="faq-item">
          <button class="faq-trigger" aria-expanded="false">How do textbook rentals work?</button>
          <div class="faq-content">
            You choose the rental duration (semester or quarter). At the end of the term, simply print the free prepaid shipping label from your account and drop off the book at any postal office.
          </div>
        </div>

        <div class="faq-item">
          <button class="faq-trigger" aria-expanded="false">Can I highlight or write in rented print books?</button>
          <div class="faq-content">
            Yes! Light highlighting and taking concise notes in margins is permitted. Excessive damage or torn pages may incur a fee upon return.
          </div>
        </div>

        <div class="faq-item">
          <button class="faq-trigger" aria-expanded="false">How do I access my e-books after purchase?</button>
          <div class="faq-content">
            Immediately after checkout, you'll receive a digital access key and direct link in your email and UniBooks account dashboard. E-books can be read offline via web browser or mobile tablet.
          </div>
        </div>

        <div class="faq-item">
          <button class="faq-trigger" aria-expanded="false">When and how do I get paid for buybacks?</button>
          <div class="faq-content">
            Once our warehouse receives and inspects your textbook (usually within 3-5 business days), payment is released immediately via Venmo, PayPal, or Direct Bank Transfer.
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- 7. SLIDE-OVER SHOPPING BAG DRAWER -->
  <div class="drawer-overlay" id="drawerOverlay"></div>
  <aside class="cart-drawer" id="cartDrawer" aria-label="Shopping Bag">
    <div class="drawer-header">
      <h3>Your Book Bag</h3>
      <button class="drawer-close" id="closeCartBtn" aria-label="Close Shopping Bag">✕</button>
    </div>

    <div class="drawer-body" id="cartItemsContainer">
      <!-- Dynamic cart items list -->
    </div>

    <div class="drawer-footer">
      <div class="summary-row">
        <span>List Price Total:</span>
        <span id="summaryOriginal">$0.00</span>
      </div>
      <div class="summary-row" style="color: var(--color-green-accent);">
        <span>Total Student Savings:</span>
        <span id="summarySavings">-$0.00</span>
      </div>
      <div class="summary-row summary-total">
        <span>Final Subtotal:</span>
        <span id="summaryTotal">$0.00</span>
      </div>
      <button class="btn btn-accent" style="width: 100%; margin-top: 1rem;">Proceed to Checkout</button>
    </div>
  </aside>

  <!-- 8. FOOTER -->
  <footer>
    <div class="container">
      <div class="footer-grid">
        <div class="footer-col">
          <h4>UniBooks</h4>
          <p style="color: #94A3B8; font-size: 0.9rem;">
            Empowering students with affordable course materials, flexible rentals, and effortless buyback solutions nationwide.
          </p>
        </div>

        <div class="footer-col">
          <h4>Student Services</h4>
          <ul>
            <li><a href="#catalog">Textbook Rental Return</a></li>
            <li><a href="#sell">Sell Books / Cash Buyback</a></li>
            <li><a href="#faq">Access Code Support</a></li>
            <li><a href="#faq">Campus Representative Program</a></li>
          </ul>
        </div>

        <div class="footer-col">
          <h4>Popular Majors</h4>
          <ul>
            <li><a href="#catalog">Computer Science & Engineering</a></li>
            <li><a href="#catalog">Business Administration</a></li>
            <li><a href="#catalog">Biological & Life Sciences</a></li>
            <li><a href="#catalog">Psychology & Social Sciences</a></li>
          </ul>
        </div>

        <div class="footer-col">
          <h4>Contact & Support</h4>
          <ul>
            <li><a href="mailto:support@unibooks.edu">support@unibooks.edu</a></li>
            <li><a href="tel:18005550199">1-800-555-0199 (Mon-Fri)</a></li>
            <li><a href="#faq">Help Center & Status</a></li>
          </ul>
        </div>
      </div>

      <div class="footer-bottom">
        <p>&copy; 2026 UniBooks Technologies Inc. Designed in compliance with WCAG 2.1 AA Accessibility Standards.</p>
      </div>
    </div>
  </footer>

  <!-- 9. JAVASCRIPT LOGIC -->
  <script>
    /* ==========================================================================
       A. MOCK TEXTBOOK DATABASE
       ========================================================================== */
    const sampleTextbooks = [
      {
        id: "tb-101",
        title: "Calculus: Early Transcendentals",
        author: "James Stewart, Daniel Clegg",
        isbn: "9781337613927",
        course: "MATH201",
        format: "rent",
        formatLabel: "Semester Rental",
        badgeClass: "badge-rent",
        price: 32.99,
        originalPrice: 289.99,
        icon: "📐"
      },
      {
        id: "tb-102",
        title: "Introduction to Algorithms (4th Edition)",
        author: "Thomas H. Cormen et al.",
        isbn: "9780262046305",
        course: "CS101",
        format: "used",
        formatLabel: "Used (Good Condition)",
        badgeClass: "badge-used",
        price: 54.50,
        originalPrice: 135.00,
        icon: "💻"
      },
      {
        id: "tb-103",
        title: "Principles of Microeconomics",
        author: "N. Gregory Mankiw",
        isbn: "9780357722718",
        course: "ECON102",
        format: "ebook",
        formatLabel: "Instant eTextbook",
        badgeClass: "badge-ebook",
        price: 24.99,
        originalPrice: 120.00,
        icon: "📊"
      },
      {
        id: "tb-104",
        title: "Organic Chemistry (9th Edition)",
        author: "Paula Yurkanis Bruice",
        isbn: "9780134042282",
        course: "CHEM301",
        format: "rent",
        formatLabel: "Semester Rental",
        badgeClass: "badge-rent",
        price: 39.99,
        originalPrice: 310.00,
        icon: "🧪"
      },
      {
        id: "tb-105",
        title: "Psychology in Everyday Life",
        author: "David G. Myers, C. Nathan DeWall",
        isbn: "9781319132101",
        course: "PSY100",
        format: "used",
        formatLabel: "Used (Acceptable)",
        badgeClass: "badge-used",
        price: 18.50,
        originalPrice: 115.00,
        icon: "🧠"
      },
      {
        id: "tb-106",
        title: "Campbell Biology (12th Edition)",
        author: "Lisa A. Urry et al.",
        isbn: "9780135188743",
        course: "BIO111",
        format: "ebook",
        formatLabel: "Instant eTextbook",
        badgeClass: "badge-ebook",
        price: 29.99,
        originalPrice: 260.00,
        icon: "🧬"
      }
    ];

    // Shopping Cart State
    let cart = [];
    let currentFilter = "all";
    let searchQuery = "";

    // DOM Elements
    const bookGrid = document.getElementById("bookGrid");
    const searchInput = document.getElementById("searchInput");
    const filterTabs = document.querySelectorAll(".filter-tab");
    const cartBadgeCount = document.getElementById("cartBadgeCount");
    const cartDrawer = document.getElementById("cartDrawer");
    const drawerOverlay = document.getElementById("drawerOverlay");
    const openCartBtn = document.getElementById("openCartBtn");
    const closeCartBtn = document.getElementById("closeCartBtn");
    const cartItemsContainer = document.getElementById("cartItemsContainer");
    const summaryOriginal = document.getElementById("summaryOriginal");
    const summarySavings = document.getElementById("summarySavings");
    const summaryTotal = document.getElementById("summaryTotal");

    /* ==========================================================================
       B. CATALOG RENDERING & FILTERING
       ========================================================================== */
    function renderCatalog() {
      // Filter logic (Search query + Active Format Tab)
      const filteredBooks = sampleTextbooks.filter(book => {
        const matchesFilter = currentFilter === "all" || book.format === currentFilter;
        const matchesSearch = 
          book.title.toLowerCase().includes(searchQuery) ||
          book.author.toLowerCase().includes(searchQuery) ||
          book.isbn.includes(searchQuery) ||
          book.course.toLowerCase().includes(searchQuery);

        return matchesFilter && matchesSearch;
      });

      bookGrid.innerHTML = "";

      if (filteredBooks.length === 0) {
        bookGrid.innerHTML = `
          <div style="grid-column: 1 / -1; text-align: center; padding: 3rem 1rem; color: var(--color-text-muted);">
            <h3>No textbooks found</h3>
            <p style="margin-top: 0.5rem;">Try adjusting your search terms or selecting a different format filter.</p>
          </div>
        `;
        return;
      }

      filteredBooks.forEach(book => {
        const savingsPercent = Math.round(((book.originalPrice - book.price) / book.originalPrice) * 100);

        const card = document.createElement("article");
        card.className = "book-card";
        card.innerHTML = `
          <div class="book-cover">
            <span aria-hidden="true">${book.icon}</span>
            <span class="badge ${book.badgeClass}">${book.formatLabel}</span>
          </div>
          <div class="book-info">
            <span class="book-course">${book.course}</span>
            <h3 class="book-title">${book.title}</h3>
            <p class="book-author">by ${book.author}</p>
            <p class="book-isbn">ISBN: ${book.isbn}</p>

            <div class="book-pricing">
              <span class="price-current">$${book.price.toFixed(2)}</span>
              <span class="price-original">$${book.originalPrice.toFixed(2)}</span>
              <span class="price-savings">Save ${savingsPercent}%</span>
            </div>

            <button 
              class="btn btn-primary" 
              style="width: 100%; margin-top: auto;" 
              onclick="addToCart('${book.id}')"
              aria-label="Add ${book.title} to shopping bag"
            >
              Add to Bag
            </button>
          </div>
        `;
        bookGrid.appendChild(card);
      });
    }

    // Filter Button Listeners
    filterTabs.forEach(tab => {
      tab.addEventListener("click", () => {
        filterTabs.forEach(t => {
          t.classList.remove("active");
          t.setAttribute("aria-selected", "false");
        });
        tab.classList.add("active");
        tab.setAttribute("aria-selected", "true");
        
        currentFilter = tab.getAttribute("data-filter");
        renderCatalog();
      });
    });

    // Real-time Search Listener
    searchInput.addEventListener("input", (e) => {
      searchQuery = e.target.value.trim().toLowerCase();
      renderCatalog();
    });

    /* ==========================================================================
       C. SHOPPING BAG & DRAWER LOGIC
       ========================================================================== */
    function addToCart(bookId) {
      const bookToAdd = sampleTextbooks.find(item => item.id === bookId);
      if (bookToAdd) {
        cart.push(bookToAdd);
        updateCartState();
        openDrawer();
      }
    }

    function removeFromCart(index) {
      cart.splice(index, 1);
      updateCartState();
    }

    function updateCartState() {
      // Update badge counter
      cartBadgeCount.textContent = cart.length;

      // Render items in slide-over drawer
      if (cart.length === 0) {
        cartItemsContainer.innerHTML = `
          <div style="text-align: center; color: var(--color-text-muted); padding: 3rem 0;">
            <p style="font-size: 2.5rem; margin-bottom: 0.5rem;">🎒</p>
            <p style="font-weight: 700;">Your bag is currently empty</p>
            <p style="font-size: 0.875rem; margin-top: 0.25rem;">Explore our catalog to add rentals or e-books.</p>
          </div>
        `;
        summaryOriginal.textContent = "$0.00";
        summarySavings.textContent = "-$0.00";
        summaryTotal.textContent = "$0.00";
        return;
      }

      cartItemsContainer.innerHTML = "";
      let totalOriginal = 0;
      let totalCurrent = 0;

      cart.forEach((item, index) => {
        totalOriginal += item.originalPrice;
        totalCurrent += item.price;

        const cartItemEl = document.createElement("div");
        cartItemEl.className = "cart-item";
        cartItemEl.innerHTML = `
          <div style="flex: 1; padding-right: 0.75rem;">
            <div class="cart-item-title">${item.title}</div>
            <div class="cart-item-meta">${item.formatLabel} • ${item.course}</div>
            <button class="cart-item-remove" onclick="removeFromCart(${index})">Remove Item</button>
          </div>
          <div style="text-align: right;">
            <div class="cart-item-price">$${item.price.toFixed(2)}</div>
            <div style="font-size: 0.75rem; color: var(--color-text-light); text-decoration: line-through;">$${item.originalPrice.toFixed(2)}</div>
          </div>
        `;
        cartItemsContainer.appendChild(cartItemEl);
      });

      const totalSavings = totalOriginal - totalCurrent;

      summaryOriginal.textContent = `$${totalOriginal.toFixed(2)}`;
      summarySavings.textContent = `-$${totalSavings.toFixed(2)}`;
      summaryTotal.textContent = `$${totalCurrent.toFixed(2)}`;
    }

    // Drawer Open / Close Functions
    function openDrawer() {
      cartDrawer.classList.add("active");
      drawerOverlay.classList.add("active");
    }

    function closeDrawer() {
      cartDrawer.classList.remove("active");
      drawerOverlay.classList.remove("active");
    }

    openCartBtn.addEventListener("click", openDrawer);
    closeCartBtn.addEventListener("click", closeDrawer);
    drawerOverlay.addEventListener("click", closeDrawer);

    /* ==========================================================================
       D. BUYBACK CALCULATOR LOGIC
       ========================================================================== */
    function calculateBuyback() {
      const isbnInput = document.getElementById("buybackIsbn").value.trim();
      const conditionMultiplier = parseFloat(document.getElementById("bookCondition").value);
      const resultBox = document.getElementById("buybackResult");
      const priceDisplay = document.getElementById("buybackPrice");

      if (!isbnInput) return;

      // Deterministic estimation simulation based on input length/char codes
      let baseVal = 35.00;
      for (let i = 0; i < isbnInput.length; i++) {
        baseVal += (isbnInput.charCodeAt(i) % 5);
      }

      const finalVal = Math.min(Math.max(baseVal * conditionMultiplier, 12.50), 95.00);

      priceDisplay.textContent = `$${finalVal.toFixed(2)}`;
      resultBox.classList.add("active");
    }

    /* ==========================================================================
       E. FAQ ACCORDION INTERACTIVITY
       ========================================================================== */
    document.querySelectorAll(".faq-trigger").forEach(button => {
      button.addEventListener("click", () => {
        const item = button.parentElement;
        const isExpanded = button.getAttribute("aria-expanded") === "true";

        // Close other items
        document.querySelectorAll(".faq-item").forEach(other => {
          other.classList.remove("active");
          other.querySelector(".faq-trigger").setAttribute("aria-expanded", "false");
        });

        if (!isExpanded) {
          item.classList.add("active");
          button.setAttribute("aria-expanded", "true");
        }
      });
    });

    // INITIALIZATION
    renderCatalog();
    updateCartState();
  </script>
</body>
</html>
