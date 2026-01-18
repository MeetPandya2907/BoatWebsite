<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BoatWebsite.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>boAt: India's No.1 Earwear & Wearables Brand</title>
    <link href="Content/boat-styles.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
    <form id="form1" runat="server">

        <!-- TOP BANNER -->
<div class="top-promo-bar">
    Get Extra 5% Off On Prepaid Orders | Code: <strong>BOATHEAD</strong> | <a href="#">Shop Now</a>
</div>

<!-- HEADER NAVIGATION -->
<header class="main-header">
    <div class="header-container">
        <!-- Logo -->
        <div class="brand-logo">
            <a href="Default.aspx">
                <h1>bo<span class="red-a">A</span>t</h1>
            </a>
        </div>

        <!-- Main Navigation Menu -->
        <nav class="nav-menu">
            <div class="nav-item dropdown-menu">
                <a href="#" class="nav-link">Categories <span class="arrow">▼</span></a>
                <!-- Dropdown will appear on hover -->
                <div class="dropdown-content">
                    <div class="dropdown-columns">
                        <div class="dropdown-col">
                            <h4>True Wireless</h4>
                            <a href="#">Airdopes</a>
                            <a href="#">Newly Launched</a>
                            <a href="#">Best Sellers</a>
                        </div>
                        <div class="dropdown-col">
                            <h4>Wireless Headphones</h4>
                            <a href="#">Rockerz</a>
                            <a href="#">Over Ear</a>
                        </div>
                        <div class="dropdown-col">
                            <h4>Smart Watches</h4>
                            <a href="#">Wave Series</a>
                            <a href="#">Xtend Series</a>
                        </div>
                        <div class="dropdown-col">
                            <h4>Wireless Speakers</h4>
                            <a href="#">Stone Series</a>
                            <a href="#">Party Speakers</a>
                        </div>
                    </div>
                </div>
            </div>
            <a href="#" class="nav-link">boAt Personalisation</a>
            <a href="#" class="nav-link">Corporate Orders</a>
            <a href="#" class="nav-link">Gifting Store</a>
            <div class="nav-item dropdown-menu">
                <a href="#" class="nav-link">More <span class="arrow">▼</span></a>
            </div>
        </nav>

        <!-- Right Side Actions -->
        <div class="header-actions">
            <!-- Search Box -->
            <div class="search-container">
                <input type="text" id="txtSearch" placeholder='Search "Earphones"' class="search-field" />
                <button class="search-button">
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                        <circle cx="11" cy="11" r="8"></circle>
                        <path d="m21 21-4.35-4.35"></path>
                    </svg>
                </button>
            </div>

            <!-- User Account Icon -->
            <a href="Login.aspx" class="icon-button">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
                    <circle cx="12" cy="7" r="4"></circle>
                </svg>
            </a>

            <!-- Shopping Cart Icon -->
            <a href="#" class="icon-button cart-button">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2">
                    <circle cx="9" cy="21" r="1"></circle>
                    <circle cx="20" cy="21" r="1"></circle>
                    <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                </svg>
                <span class="cart-badge">0</span>
            </a>
        </div>
    </div>
</header>

<!-- HERO SLIDER SECTION -->
<div class="slider-container">
    
    <div class="hero-slide active-slide">
        <a href="#"> <img src="Images/banner1.jpg" alt="Banner 1" class="full-slider-img" />
        </a>
    </div>

    <div class="hero-slide">
        <a href="#">
            <img src="Images/banner2.jpg" alt="Banner 2" class="full-slider-img" />
        </a>
    </div>

    <div class="hero-slide">
        <a href="#">
            <img src="Images/banner3.jpg" alt="Banner 3" class="full-slider-img" />
        </a>
    </div>

    <div class="hero-slide">
    <a href="#">
        <img src="Images/banner4.jpg" alt="Banner 3" class="full-slider-img" />
    </a>
</div>

    <div class="hero-slide">
    <a href="#">
        <img src="Images/banner5.jpg" alt="Banner 3" class="full-slider-img" />
    </a>
</div>

    <div class="hero-slide">
    <a href="#">
        <img src="Images/banner6.jpg" alt="Banner 3" class="full-slider-img" />
    </a>
</div>

    <div class="hero-slide">
    <a href="#">
        <img src="Images/banner7.jpg" alt="Banner 3" class="full-slider-img" />
    </a>
</div>

    <div class="hero-slide">
    <a href="#">
        <img src="Images/banner8.jpg" alt="Banner 3" class="full-slider-img" />
    </a>
</div>

    <button class="slider-arrow prev-arrow" type="button">&#10094;</button>
    <button class="slider-arrow next-arrow" type="button">&#10095;</button>

    <div class="slider-dots">
        <span class="dot active-dot" onclick="currentSlide(0)"></span>
        <span class="dot" onclick="currentSlide(1)"></span>
        <span class="dot" onclick="currentSlide(2)"></span>
        <span class="dot" onclick="currentSlide(3)"></span>
        <span class="dot" onclick="currentSlide(4)"></span>
        <span class="dot" onclick="currentSlide(5)"></span>
        <span class="dot" onclick="currentSlide(6)"></span>
        <span class="dot" onclick="currentSlide(7)"></span>
    </div>

</div>
        <!-- Quick Categories Bar -->
        <section class="quick-categories">
            <div class="container">
                <div class="cat-scroll">
                    <div class="quick-cat-item">
                        <div class="cat-box">
                            <span class="cat-emoji">🏠</span>
                            <p>Home Audio</p>
                        </div>
                    </div>
                    <div class="quick-cat-item">
                        <div class="cat-box">
                            <span class="cat-emoji">🎧</span>
                            <p>Nirvana</p>
                        </div>
                    </div>
                    <div class="quick-cat-item">
                        <div class="cat-box">
                            <span class="cat-emoji">🎵</span>
                            <p>Party Speakers</p>
                        </div>
                    </div>
                    <div class="quick-cat-item">
                        <div class="cat-box">
                            <span class="cat-emoji">⌚</span>
                            <p>Smart Watches</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Best Deals -->
        <section class="products-section">
            <div class="container">
                <div class="section-head">
                    <h2>Sale Is Live</h2>
                    <a href="#" class="view-link">View All →</a>
                </div>
                <div class="product-grid">
                    <!-- Product 1 -->
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/product1.jpg" alt="Product" />
                            <span class="discount-tag">67% Off</span>
                        </div>
                        <div class="product-info">
                            <h3>boAt Airdopes 141</h3>
                            <div class="rating">⭐⭐⭐⭐⭐ <span>(4.5)</span></div>
                            <div class="pricing">
                                <span class="price">₹1,299</span>
                                <span class="old-price">₹3,990</span>
                            </div>
                            <button class="add-btn">Add to Cart</button>
                        </div>
                    </div>

                    <!-- Product 2 -->
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/product2.jpg" alt="Product" />
                            <span class="discount-tag">50% Off</span>
                        </div>
                        <div class="product-info">
                            <h3>boAt Rockerz 450</h3>
                            <div class="rating">⭐⭐⭐⭐⭐ <span>(4.7)</span></div>
                            <div class="pricing">
                                <span class="price">₹1,499</span>
                                <span class="old-price">₹2,990</span>
                            </div>
                            <button class="add-btn">Add to Cart</button>
                        </div>
                    </div>

                    <!-- Product 3 -->
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/product3.jpg" alt="Product" />
                            <span class="discount-tag">48% Off</span>
                        </div>
                        <div class="product-info">
                            <h3>boAt Stone 350</h3>
                            <div class="rating">⭐⭐⭐⭐☆ <span>(4.3)</span></div>
                            <div class="pricing">
                                <span class="price">₹1,799</span>
                                <span class="old-price">₹3,490</span>
                            </div>
                            <button class="add-btn">Add to Cart</button>
                        </div>
                    </div>

                    <!-- Product 4 -->
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/product4.jpg" alt="Product" />
                            <span class="discount-tag">66% Off</span>
                        </div>
                        <div class="product-info">
                            <h3>boAt Wave Call</h3>
                            <div class="rating">⭐⭐⭐⭐⭐ <span>(4.6)</span></div>
                            <div class="pricing">
                                <span class="price">₹1,999</span>
                                <span class="old-price">₹5,990</span>
                            </div>
                            <button class="add-btn">Add to Cart</button>
                        </div>
                    </div>

                    <!-- Product 5 -->
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/product5.jpg" alt="Product" />
                            <span class="discount-tag">60% Off</span>
                        </div>
                        <div class="product-info">
                            <h3>boAt Airdopes 131</h3>
                            <div class="rating">⭐⭐⭐⭐☆ <span>(4.2)</span></div>
                            <div class="pricing">
                                <span class="price">₹999</span>
                                <span class="old-price">₹2,490</span>
                            </div>
                            <button class="add-btn">Add to Cart</button>
                        </div>
                    </div>

                    
                </div>
            </div>
        </section>

        <!-- Nirvana Banner -->
        <section class="nirvana-banner">
            <div class="nirvana-content">
                <div class="nirvana-text">
                    <img src="Images/nirvana-logo.png" alt="Nirvana" style="height:60px;" />
                    <h2>NIRVANA</h2>
                    <p>by boAt</p>
                    <p class="tagline">PREMIUM AUDIO EXPERIENCE</p>
                    <button class="nirvana-btn">Explore Now</button>
                </div>
                <div class="nirvana-image">
                    <img src="Images/nirvana-product.png" alt="Nirvana Product" />
                </div>
            </div>
        </section>

        <!-- Shop by Categories -->
        <section class="products-section">
            <div class="container">
                <div class="section-head">
                    <h2>Shop by Categories</h2>
                    <a href="#" class="view-link">View All →</a>
                </div>
                <div class="category-cards">
                    <div class="cat-card-item">
                        <div class="cat-icon-big">🎧</div>
                        <h4>True Wireless Earbuds</h4>
                        <a href="#" class="shop-link">Shop Now →</a>
                    </div>
                    <div class="cat-card-item">
                        <div class="cat-icon-big">🎵</div>
                        <h4>Wireless Headphones</h4>
                        <a href="#" class="shop-link">Shop Now →</a>
                    </div>
                    <div class="cat-card-item">
                        <div class="cat-icon-big">🎤</div>
                        <h4>Wired Earphones</h4>
                        <a href="#" class="shop-link">Shop Now →</a>
                    </div>
                    <div class="cat-card-item">
                        <div class="cat-icon-big">🔊</div>
                        <h4>Bluetooth Speakers</h4>
                        <a href="#" class="shop-link">Shop Now →</a>
                    </div>
                    <div class="cat-card-item">
                        <div class="cat-icon-big">⌚</div>
                        <h4>Smart Watches</h4>
                        <a href="#" class="shop-link">Shop Now →</a>
                    </div>
                    <div class="cat-card-item">
                        <div class="cat-icon-big">🎮</div>
                        <h4>Gaming</h4>
                        <a href="#" class="shop-link">Shop Now →</a>
                    </div>
                    <div class="cat-card-item">
                        <div class="cat-icon-big">💪</div>
                        <h4>Fitness</h4>
                        <a href="#" class="shop-link">Shop Now →</a>
                    </div>
                    <div class="cat-card-item">
                        <div class="cat-icon-big">🔌</div>
                        <h4>Misc Accessories</h4>
                        <a href="#" class="shop-link">Shop Now →</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- Explore Bestsellers -->
        <section class="products-section grey-bg">
            <div class="container">
                <div class="section-head">
                    <h2>Explore Bestsellers</h2>
                    <a href="#" class="view-link">View All →</a>
                </div>
                <div class="product-grid">
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/best1.jpg" alt="Bestseller" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Airdopes 141</h3>
                            <div class="pricing">
                                <span class="price">₹1,299</span>
                                <span class="old-price">₹3,990</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/best2.jpg" alt="Bestseller" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Rockerz 450</h3>
                            <div class="pricing">
                                <span class="price">₹1,499</span>
                                <span class="old-price">₹2,990</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/best3.jpg" alt="Bestseller" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Stone 350</h3>
                            <div class="pricing">
                                <span class="price">₹1,799</span>
                                <span class="old-price">₹3,490</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/best4.jpg" alt="Bestseller" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Wave Call</h3>
                            <div class="pricing">
                                <span class="price">₹1,999</span>
                                <span class="old-price">₹5,990</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/best5.jpg" alt="Bestseller" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Airdopes 131</h3>
                            <div class="pricing">
                                <span class="price">₹999</span>
                                <span class="old-price">₹2,490</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/best6.jpg" alt="Bestseller" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Stone 650</h3>
                            <div class="pricing">
                                <span class="price">₹1,299</span>
                                <span class="old-price">₹2,490</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Top Picks For You -->
        <section class="products-section">
            <div class="container">
                <div class="section-head">
                    <h2>Top Picks For You</h2>
                    <a href="#" class="view-link">View All →</a>
                </div>
                <div class="product-grid">
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/pick1.jpg" alt="Top Pick" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Airdopes 161</h3>
                            <div class="pricing">
                                <span class="price">₹1,799</span>
                                <span class="old-price">₹4,990</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/pick2.jpg" alt="Top Pick" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Rockerz 550</h3>
                            <div class="pricing">
                                <span class="price">₹1,799</span>
                                <span class="old-price">₹3,990</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/pick3.jpg" alt="Top Pick" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Stone 1000</h3>
                            <div class="pricing">
                                <span class="price">₹2,499</span>
                                <span class="old-price">₹4,990</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/pick4.jpg" alt="Top Pick" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Wave Pro</h3>
                            <div class="pricing">
                                <span class="price">₹2,999</span>
                                <span class="old-price">₹7,990</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/pick5.jpg" alt="Top Pick" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Rockerz 255</h3>
                            <div class="pricing">
                                <span class="price">₹1,499</span>
                                <span class="old-price">₹3,990</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <div class="product-img-wrap">
                            <img src="Images/pick6.jpg" alt="Top Pick" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Airdopes 381</h3>
                            <div class="pricing">
                                <span class="price">₹1,999</span>
                                <span class="old-price">₹4,990</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Shop by Lifestyle -->
        <section class="products-section">
            <div class="container">
                <div class="section-head">
                    <h2>Shop by Lifestyle</h2>
                    <a href="#" class="view-link">View All →</a>
                </div>
                <div class="lifestyle-row">
                    <div class="lifestyle-box">
                        <img src="Images/lifestyle1.jpg" alt="Casual Vibes" />
                        <div class="lifestyle-overlay">
                            <h3>Casual Vibes</h3>
                            <button class="lifestyle-btn">Shop Now</button>
                        </div>
                    </div>
                    <div class="lifestyle-box">
                        <img src="Images/lifestyle2.jpg" alt="For Parties" />
                        <div class="lifestyle-overlay">
                            <h3>For Parties</h3>
                            <button class="lifestyle-btn">Shop Now</button>
                        </div>
                    </div>
                    <div class="lifestyle-box">
                        <img src="Images/lifestyle3.jpg" alt="For Work" />
                        <div class="lifestyle-overlay">
                            <h3>For Work</h3>
                            <button class="lifestyle-btn">Shop Now</button>
                        </div>
                    </div>
                    <div class="lifestyle-box">
                        <img src="Images/lifestyle4.jpg" alt="For Athleisure" />
                        <div class="lifestyle-overlay">
                            <h3>For Athleisure</h3>
                            <button class="lifestyle-btn">Shop Now</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- New Of boAt -->
        <section class="products-section grey-bg">
            <div class="container">
                <div class="section-head">
                    <h2>New Of boAt</h2>
                    <a href="#" class="view-link">View All →</a>
                </div>
                <div class="product-grid">
                    <div class="product-box">
                        <span class="new-launch-badge">NEW LAUNCH</span>
                        <div class="product-img-wrap">
                            <img src="Images/new1.jpg" alt="New Product" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Valour Ring 1</h3>
                            <div class="pricing">
                                <span class="price">₹10,999</span>
                                <span class="old-price">₹12,999</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <span class="new-launch-badge">NEW LAUNCH</span>
                        <div class="product-img-wrap">
                            <img src="Images/new2.jpg" alt="New Product" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Immortal 1300</h3>
                            <div class="pricing">
                                <span class="price">₹3,499</span>
                                <span class="old-price">₹7,990</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <span class="new-launch-badge">NEW LAUNCH</span>
                        <div class="product-img-wrap">
                            <img src="Images/new3.jpg" alt="New Product" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Airdopes 800</h3>
                            <div class="pricing">
                                <span class="price">₹2,999</span>
                                <span class="old-price">₹6,990</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <span class="new-launch-badge">NEW LAUNCH</span>
                        <div class="product-img-wrap">
                            <img src="Images/new4.jpg" alt="New Product" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Stone 1500</h3>
                            <div class="pricing">
                                <span class="price">₹3,999</span>
                                <span class="old-price">₹7,990</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <span class="new-launch-badge">NEW LAUNCH</span>
                        <div class="product-img-wrap">
                            <img src="Images/new5.jpg" alt="New Product" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Wave Ultra</h3>
                            <div class="pricing">
                                <span class="price">₹4,999</span>
                                <span class="old-price">₹9,990</span>
                            </div>
                        </div>
                    </div>
                    <div class="product-box">
                        <span class="new-launch-badge">NEW LAUNCH</span>
                        <div class="product-img-wrap">
                            <img src="Images/new6.jpg" alt="New Product" />
                        </div>
                        <div class="product-info">
                            <h3>boAt Nirvana Ion ANC</h3>
                            <div class="pricing">
                                <span class="price">₹2,999</span>
                                <span class="old-price">₹5,990</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Join the Tribe -->
        <section class="tribe-section">
            <div class="container text-center">
                <h2>Join the Tribe</h2>
                <p>Join the #boAtheads & stay updated with latest launches</p>
                <div class="tribe-images">
                    <img src="Images/tribe1.jpg" alt="Tribe" />
                    <img src="Images/tribe2.jpg" alt="Tribe" />
                    <img src="Images/tribe3.jpg" alt="Tribe" />
                </div>
            </div>
        </section>

        <!-- Blogs -->
        <section class="products-section">
            <div class="container">
                <div class="section-head">
                    <h2>Blogs</h2>
                    <a href="#" class="view-link">View All →</a>
                </div>
                <div class="blog-grid">
                    <div class="blog-box">
                        <img src="Images/blog1.jpg" alt="Blog" />
                        <div class="blog-text">
                            <h3>Buying Earbuds vs Headphones 101: Which One Suits You More?</h3>
                            <p>Guide to choosing between earbuds and headphones...</p>
                            <a href="#" class="read-link">Read More →</a>
                        </div>
                    </div>
                    <div class="blog-box">
                        <img src="Images/blog2.jpg" alt="Blog" />
                        <div class="blog-text">
                            <h3>The Complete Guide To Buying Wireless Earbuds</h3>
                            <p>Everything you need to know before buying...</p>
                            <a href="#" class="read-link">Read More →</a>
                        </div>
                    </div>
                    <div class="blog-box">
                        <img src="Images/blog3.jpg" alt="Blog" />
                        <div class="blog-text">
                            <h3>A Fit Experience in Trendy Smartwatches</h3>
                            <p>Discover the best smartwatches for fitness...</p>
                            <a href="#" class="read-link">Read More →</a>
                        </div>
                    </div>
                    <div class="blog-box">
                        <img src="Images/blog4.jpg" alt="Blog" />
                        <div class="blog-text">
                            <h3>8 Reasons to Choose Smartwatches in India</h3>
                            <p>Why smartwatches are must-have gadgets...</p>
                            <a href="#" class="read-link">Read More →</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- In the Press -->
        <section class="press-section grey-bg">
            <div class="container">
                <div class="section-head">
                    <h2>In the Press</h2>
                    <a href="#" class="view-link">View All →</a>
                </div>
                <div class="press-logos">
                    <div class="press-logo-box">
                        <img src="Images/techcrunch.png" alt="TechCrunch" />
                    </div>
                    <div class="press-logo-box">
                        <img src="Images/forbes.png" alt="Forbes" />
                    </div>
                    <div class="press-logo-box">
                        <img src="Images/et.png" alt="Economic Times" />
                    </div>
                </div>
                <div class="press-quote-box">
                    <div class="quote-mark">"</div>
                    <p class="quote-text">boAt is the first truly wireless earphone brand from India to be featured on US Billboard.</p>
                    <p class="quote-author">- The Economic Times</p>
                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <div class="footer-grid">
                    <div class="footer-col">
                        <h3 class="footer-logo">bo<span>A</span>t</h3>
                        <p>Subscribe to email alerts</p>
                        <div class="newsletter-form">
                            <asp:TextBox ID="txtEmail" runat="server" placeholder="Email Address" CssClass="newsletter-input"></asp:TextBox>
                            <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe" CssClass="newsletter-btn" />
                        </div>
                    </div>
                    <div class="footer-col">
                        <h4>Shop</h4>
                        <ul>
                            <li><a href="#">True Wireless Earbuds</a></li>
                            <li><a href="#">Wired Headphones</a></li>
                            <li><a href="#">Home Audio</a></li>
                            <li><a href="#">Smart Watches</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Help</h4>
                        <ul>
                            <li><a href="#">Track Order</a></li>
                            <li><a href="#">Warranty</a></li>
                            <li><a href="#">Return Policy</a></li>
                            <li><a href="#">Service Centers</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Company</h4>
                        <ul>
                            <li><a href="#">About boAt</a></li>
                            <li><a href="#">Careers</a></li>
                            <li><a href="#">Press</a></li>
                            <li><a href="#">Security</a></li>
                        </ul>
                    </div>
                    <div class="footer-col">
                        <h4>Partner</h4>
                        <ul>
                            <li><a href="#">Affiliate</a></li>
                            <li><a href="#">Influencer</a></li>
                        </ul>
                        <div class="app-download">
                            <a href="#"><img src="Images/app-store.png" alt="App Store" /></a>
                            <a href="#"><img src="Images/play-store.png" alt="Play Store" /></a>
                        </div>
                    </div>
                </div>
                <div class="footer-bottom">
                    <div class="social-icons">
                        <a href="#">📘</a>
                        <a href="#">📸</a>
                        <a href="#">🐦</a>
                        <a href="#">▶️</a>
                        <a href="#">💼</a>
                    </div>
                    <p>© 2024 Imagine Marketing Limited. All Rights Reserved.</p>
                    <div class="payment-icons">
                        <span>💳</span><span>💳</span><span>💰</span>
                    </div>
                </div>
            </div>
        </footer>

    </form>
    <script type="text/javascript">
    let slideIndex = 0;
    const slides = document.querySelectorAll(".hero-slide");
    const dots = document.querySelectorAll(".dot");
    const prevBtn = document.querySelector(".prev-arrow");
    const nextBtn = document.querySelector(".next-arrow");

    // Function to show a specific slide
    function showSlide(n) {
        // Reset index if out of bounds
        if (n >= slides.length) slideIndex = 0;
        if (n < 0) slideIndex = slides.length - 1;

        // Hide all slides
        slides.forEach(slide => slide.classList.remove("active-slide"));
        dots.forEach(dot => dot.classList.remove("active-dot"));

        // Show the current slide
        slides[slideIndex].classList.add("active-slide");
        dots[slideIndex].classList.add("active-dot");
    }

    // Event Listeners for Buttons
    nextBtn.addEventListener("click", () => {
        slideIndex++;
        showSlide(slideIndex);
    });

    prevBtn.addEventListener("click", () => {
        slideIndex--;
        showSlide(slideIndex);
    });

    // Auto-play (Optional: Changes slide every 5 seconds)
    setInterval(() => {
        slideIndex++;
        showSlide(slideIndex);
    }, 7000);
    </script>
</body>
</html>