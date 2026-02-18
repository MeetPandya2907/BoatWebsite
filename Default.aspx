<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BoatWebsite.Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>boAt: India's No.1 Earwear &amp; Wearables Brand</title>
    <link href="Content/boat-styles.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Barlow:ital,wght@0,400;0,600;0,700;0,800;0,900;1,700&family=Barlow+Condensed:wght@700;800;900&display=swap" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">
    <span class="cart-count"><%: cartCount %></span>
<!-- ===== TOP PROMO BAR ===== -->
<div class="top-promo-bar">
    <span>🎉 Get Extra 5% Off On Prepaid Orders | Code: <strong>BOATHEAD</strong></span>
    <span class="promo-sep">|</span>
    <span>Free Shipping on orders above ₹499</span>
    <span class="promo-sep">|</span>
    <a href="#">Shop Now →</a>
</div>

<!-- ===== MAIN HEADER ===== -->
<header class="main-header">
    <div class="header-inner">
        <!-- Logo -->
        <div class="brand-logo">
            <a href="Default.aspx">bo<span>A</span>t</a>
        </div>

        <!-- Nav Links -->
        <nav class="main-nav">
            <div class="nav-item has-dropdown">
                <a href="#" class="nav-link">Categories <span class="caret">▾</span></a>
                <div class="mega-dropdown">
                    <div class="mega-col">
                        <h5>True Wireless</h5>
                        <a href="#">Airdopes</a>
                        <a href="#">Newly Launched</a>
                        <a href="#">Best Sellers</a>
                        <a href="#">Under ₹999</a>
                    </div>
                    <div class="mega-col">
                        <h5>Headphones</h5>
                        <a href="#">Rockerz</a>
                        <a href="#">Over Ear</a>
                        <a href="#">On Ear</a>
                        <a href="#">Neckbands</a>
                    </div>
                    <div class="mega-col">
                        <h5>Smart Watches</h5>
                        <a href="#">Wave Series</a>
                        <a href="#">Xtend Series</a>
                        <a href="#">Matrix Series</a>
                        <a href="#">Lunar Series</a>
                    </div>
                    <div class="mega-col">
                        <h5>Speakers</h5>
                        <a href="#">Stone Series</a>
                        <a href="#">Party Speakers</a>
                        <a href="#">Home Audio</a>
                    </div>
                    <div class="mega-col">
                        <h5>Gaming</h5>
                        <a href="#">Immortal Series</a>
                        <a href="#">Headsets</a>
                        <a href="#">Controllers</a>
                    </div>
                </div>
            </div>
            <a href="#" class="nav-link">boAt Personalisation</a>
            <a href="#" class="nav-link">Corporate Orders</a>
            <a href="#" class="nav-link">Gifting Store</a>
            <div class="nav-item has-dropdown">
                <a href="#" class="nav-link">More <span class="caret">▾</span></a>
                <div class="mini-dropdown">
                    <a href="#">Accessories</a>
                    <a href="#">Smart Ring</a>
                    <a href="#">Power Banks</a>
                    <a href="#">Cables</a>
                </div>
            </div>
        </nav>

        <!-- Header Right -->
        <div class="header-right">
            <div class="search-wrap">
                <input type="text" placeholder='Search "Earphones"' class="search-input" />
                <button class="search-btn" type="button">
                    <svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2.5"><circle cx="11" cy="11" r="8"/><path d="m21 21-4.35-4.35"/></svg>
                </button>
            </div>

            <% if (Session["UserEmail"] != null) { %>
            <div class="user-dropdown">
                <button class="user-btn" type="button">
                    <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                    <span><%: Session["FullName"] %></span>
                </button>
                <div class="user-drop-menu">
                    <a href="#">My Orders</a>
                    <a href="#">My Profile</a>
                    <a href="#">Wishlist</a>
                    <a href="Default.aspx?logout=1" class="logout-link">Logout</a>
                </div>
            </div>
            <% } else { %>
            <a href="Login.aspx" class="hdr-icon-btn" title="Login">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
            </a>
            <% } %>

            <a href="#" class="hdr-icon-btn wishlist-btn" title="Wishlist">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
            </a>

            <a href="#" class="hdr-icon-btn cart-btn" title="Cart">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="9" cy="21" r="1"/><circle cx="20" cy="21" r="1"/><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"/></svg>
                <span class="cart-count">0</span>
            </a>
        </div>
    </div>
</header>

<!-- ===== HERO BANNER SLIDER ===== -->
<section class="hero-section">
    <div class="hero-slider" id="heroSlider">
        <div class="hero-slide active-slide">
            <a href="#"><img src="Images/banner1.jpg" alt="Banner 1" /></a>
        </div>
        <div class="hero-slide">
            <a href="#"><img src="Images/banner2.jpg" alt="Banner 2" /></a>
        </div>
        <div class="hero-slide">
            <a href="#"><img src="Images/banner3.jpg" alt="Banner 3" /></a>
        </div>
        <div class="hero-slide">
            <a href="#"><img src="Images/banner4.jpg" alt="Banner 4" /></a>
        </div>
        <div class="hero-slide">
            <a href="#"><img src="Images/banner5.jpg" alt="Banner 5" /></a>
        </div>
        <button class="slide-arrow prev-slide" type="button" onclick="changeSlide(-1)">&#10094;</button>
        <button class="slide-arrow next-slide" type="button" onclick="changeSlide(1)">&#10095;</button>
        <div class="slide-dots" id="slideDots">
            <span class="sdot active-sdot" onclick="goSlide(0)"></span>
            <span class="sdot" onclick="goSlide(1)"></span>
            <span class="sdot" onclick="goSlide(2)"></span>
            <span class="sdot" onclick="goSlide(3)"></span>
            <span class="sdot" onclick="goSlide(4)"></span>
        </div>
    </div>
</section>

<!-- ===== TRUST STATS BAR ===== -->
<div class="stats-bar">
    <div class="stats-inner">
        <div class="stat-pill">
            <span class="stat-num">30M+</span>
            <span class="stat-lbl">Happy Customers</span>
        </div>
        <div class="stat-divider"></div>
        <div class="stat-pill">
            <span class="stat-num">500+</span>
            <span class="stat-lbl">Products</span>
        </div>
        <div class="stat-divider"></div>
        <div class="stat-pill">
            <span class="stat-num">#1</span>
            <span class="stat-lbl">Audio Brand India</span>
        </div>
        <div class="stat-divider"></div>
        <div class="stat-pill">
            <span class="stat-num">1 Year</span>
            <span class="stat-lbl">Warranty</span>
        </div>
        <div class="stat-divider"></div>
        <div class="stat-pill">
            <span class="stat-num">Free</span>
            <span class="stat-lbl">Shipping ₹499+</span>
        </div>
    </div>
</div>

<!-- ===== SALE IS LIVE ===== -->
<div class="products-row">
    <asp:Repeater ID="rptFeatured" runat="server">
        <ItemTemplate>
            <div class="pcard">
                <div class="pcard-img">
                    <a href='ProductDetail.aspx?id=<%# Eval("ProductID") %>'>
                        <img src='<%# Eval("ImageURL") %>' alt='<%# Eval("ProductName") %>' />
                    </a>
                    <%# (int)Eval("Discount") > 0 ? "<span class='pbadge sale'>" + Eval("Discount") + "% Off</span>" : "" %>
                    <button class="pwish" type="button">♡</button>
                </div>
                <div class="pcard-body">
                    <p class="pname"><%# Eval("ProductName") %></p>
                    <div class="prating">
                        <%# GetStars(Convert.ToDecimal(Eval("Rating"))) %>
                        <span><%# Eval("Rating") %> (<%# GetReviewCount(Convert.ToInt32(Eval("ReviewCount"))) %>)</span>
                    </div>
                    <div class="ppricing">
                        <span class="pprice">₹<%# String.Format("{0:N0}", Eval("Price")) %></span>
                        <span class="pold">₹<%# String.Format("{0:N0}", Eval("OldPrice")) %></span>
                    </div>
                    <a href='ProductDetail.aspx?id=<%# Eval("ProductID") %>'
                       class="padd-btn"
                       style="display:block;text-align:center;padding:9px 0;text-decoration:none;">
                        Add to Cart
                    </a>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>



<!-- ===== NIRVANA BANNER ===== -->
<section class="nirvana-strip">
    <div class="nirvana-inner">
        <div class="nirvana-left">
            <p class="nirvana-sub">Premium Series</p>
            <h2 class="nirvana-title">NIRVANA <span>by boAt</span></h2>
            <p class="nirvana-desc">Experience next-level audio with our flagship NIRVANA collection</p>
            <button class="nirvana-cta" type="button">Explore Now →</button>
        </div>
        <div class="nirvana-right">
            <img src="Images/nirvana-product.png" alt="Nirvana" />
        </div>
    </div>
</section>

<!-- ===== BIG DEALS WITH TABS ===== -->
<section class="section-wrap grey-wrap">
    <div class="section-container">
        <div class="section-header">
            <h2 class="section-title">Big Deals 💥</h2>
            <div class="filter-tabs">
                <button class="ftab active" onclick="filterTab(this)">All Deals</button>
                <button class="ftab" onclick="filterTab(this)">Electronics</button>
                <button class="ftab" onclick="filterTab(this)">Audio</button>
                <button class="ftab" onclick="filterTab(this)">Wearables</button>
            </div>
            <a href="#" class="view-all-link">View All →</a>
        </div>
        <div class="products-row">
            <div class="pcard">
                <div class="pcard-img">
                    <img src="Images/new1.jpg" alt="Product" />
                    <span class="pbadge new">NEW</span>
                    <button class="pwish" type="button">♡</button>
                </div>
                <div class="pcard-body">
                    <p class="pname">boAt Valour Ring 1</p>
                    <div class="prating">★★★★★ <span>4.8 (1K)</span></div>
                    <div class="ppricing">
                        <span class="pprice">₹10,999</span>
                        <span class="pold">₹12,999</span>
                    </div>
                    <button class="padd-btn" type="button">Add to Cart</button>
                </div>
            </div>
            <div class="pcard">
                <div class="pcard-img">
                    <img src="Images/new2.jpg" alt="Product" />
                    <span class="pbadge sale">56% Off</span>
                    <button class="pwish" type="button">♡</button>
                </div>
                <div class="pcard-body">
                    <p class="pname">boAt Immortal 1300</p>
                    <div class="prating">★★★★★ <span>4.6 (2K)</span></div>
                    <div class="ppricing">
                        <span class="pprice">₹3,499</span>
                        <span class="pold">₹7,990</span>
                    </div>
                    <button class="padd-btn" type="button">Add to Cart</button>
                </div>
            </div>
            <div class="pcard">
                <div class="pcard-img">
                    <img src="Images/new3.jpg" alt="Product" />
                    <span class="pbadge sale">57% Off</span>
                    <button class="pwish" type="button">♡</button>
                </div>
                <div class="pcard-body">
                    <p class="pname">boAt Airdopes 800</p>
                    <div class="prating">★★★★☆ <span>4.5 (4K)</span></div>
                    <div class="ppricing">
                        <span class="pprice">₹2,999</span>
                        <span class="pold">₹6,990</span>
                    </div>
                    <button class="padd-btn" type="button">Add to Cart</button>
                </div>
            </div>
            <div class="pcard">
                <div class="pcard-img">
                    <img src="Images/new4.jpg" alt="Product" />
                    <span class="pbadge sale">49% Off</span>
                    <button class="pwish" type="button">♡</button>
                </div>
                <div class="pcard-body">
                    <p class="pname">boAt Stone 1500</p>
                    <div class="prating">★★★★☆ <span>4.3 (2K)</span></div>
                    <div class="ppricing">
                        <span class="pprice">₹3,999</span>
                        <span class="pold">₹7,990</span>
                    </div>
                    <button class="padd-btn" type="button">Add to Cart</button>
                </div>
            </div>
            <div class="pcard">
                <div class="pcard-img">
                    <img src="Images/new5.jpg" alt="Product" />
                    <span class="pbadge sale">50% Off</span>
                    <button class="pwish" type="button">♡</button>
                </div>
                <div class="pcard-body">
                    <p class="pname">boAt Wave Ultra</p>
                    <div class="prating">★★★★★ <span>4.7 (3K)</span></div>
                    <div class="ppricing">
                        <span class="pprice">₹4,999</span>
                        <span class="pold">₹9,990</span>
                    </div>
                    <button class="padd-btn" type="button">Add to Cart</button>
                </div>
            </div>
            <div class="pcard">
                <div class="pcard-img">
                    <img src="Images/new6.jpg" alt="Product" />
                    <span class="pbadge sale">50% Off</span>
                    <button class="pwish" type="button">♡</button>
                </div>
                <div class="pcard-body">
                    <p class="pname">boAt Nirvana Ion ANC</p>
                    <div class="prating">★★★★★ <span>4.8 (5K)</span></div>
                    <div class="ppricing">
                        <span class="pprice">₹2,999</span>
                        <span class="pold">₹5,990</span>
                    </div>
                    <button class="padd-btn" type="button">Add to Cart</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ===== SHOP BY CATEGORIES ===== -->
<section class="section-wrap">
    <div class="section-container">
        <div class="section-header">
            <h2 class="section-title">Shop by Categories</h2>
            <a href="#" class="view-all-link">View All →</a>
        </div>
        <div class="cat-grid">
            <div class="cat-tile">
                <div class="cat-tile-img"><img src="Images/product1.jpg" alt="TWS" /></div>
                <p>True Wireless</p>
            </div>
            <div class="cat-tile">
                <div class="cat-tile-img"><img src="Images/product2.jpg" alt="Headphones" /></div>
                <p>Headphones</p>
            </div>
            <div class="cat-tile">
                <div class="cat-tile-img"><img src="Images/product4.jpg" alt="Smart Watch" /></div>
                <p>Smart Watches</p>
            </div>
            <div class="cat-tile">
                <div class="cat-tile-img"><img src="Images/product3.jpg" alt="Speakers" /></div>
                <p>Speakers</p>
            </div>
            <div class="cat-tile">
                <div class="cat-tile-img"><img src="Images/new2.jpg" alt="Gaming" /></div>
                <p>Gaming</p>
            </div>
            <div class="cat-tile">
                <div class="cat-tile-img"><img src="Images/product5.jpg" alt="Wired" /></div>
                <p>Wired Earphones</p>
            </div>
            <div class="cat-tile">
                <div class="cat-tile-img"><img src="Images/new5.jpg" alt="Fitness" /></div>
                <p>Fitness</p>
            </div>
            <div class="cat-tile">
                <div class="cat-tile-img"><img src="Images/new6.jpg" alt="Accessories" /></div>
                <p>Accessories</p>
            </div>
            <div class="cat-tile">
                <div class="cat-tile-img"><img src="Images/new1.jpg" alt="Smart Ring" /></div>
                <p>Smart Ring</p>
            </div>
            <div class="cat-tile">
                <div class="cat-tile-img"><img src="Images/best1.jpg" alt="Home Audio" /></div>
                <p>Home Audio</p>
            </div>
        </div>
    </div>
</section>

<!-- ===== EXPLORE BESTSELLERS ===== -->
<div class="products-row">
    <asp:Repeater ID="rptBestsellers" runat="server">
        <ItemTemplate>
            <div class="pcard">
                <div class="pcard-img">
                    <a href='ProductDetail.aspx?id=<%# Eval("ProductID") %>'>
                        <img src='<%# Eval("ImageURL") %>' alt='<%# Eval("ProductName") %>' />
                    </a>
                    <%# (int)Eval("Discount") > 0 ? "<span class='pbadge sale'>" + Eval("Discount") + "% Off</span>" : "" %>
                    <button class="pwish" type="button">♡</button>
                </div>
                <div class="pcard-body">
                    <p class="pname"><%# Eval("ProductName") %></p>
                    <div class="prating">
                        <%# GetStars(Convert.ToDecimal(Eval("Rating"))) %>
                        <span><%# Eval("Rating") %> (<%# GetReviewCount(Convert.ToInt32(Eval("ReviewCount"))) %>)</span>
                    </div>
                    <div class="ppricing">
                        <span class="pprice">₹<%# String.Format("{0:N0}", Eval("Price")) %></span>
                        <span class="pold">₹<%# String.Format("{0:N0}", Eval("OldPrice")) %></span>
                    </div>
                    <a href='ProductDetail.aspx?id=<%# Eval("ProductID") %>'
                       class="padd-btn"
                       style="display:block;text-align:center;padding:9px 0;text-decoration:none;">
                        View Product
                    </a>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>


<!-- ===== TOP PICKS FOR YOU ===== -->
<section class="section-wrap">
    <div class="section-container">
        <div class="section-header">
            <h2 class="section-title">Top Picks For You 🎯</h2>
            <a href="#" class="view-all-link">View All →</a>
        </div>
        <div class="products-row">
            <div class="pcard">
                <div class="pcard-img"><img src="Images/pick1.jpg" alt="Pick" /><button class="pwish" type="button">♡</button></div>
                <div class="pcard-body">
                    <p class="pname">boAt Airdopes 161</p>
                    <div class="prating">★★★★★ <span>4.5 (7K)</span></div>
                    <div class="ppricing"><span class="pprice">₹1,799</span><span class="pold">₹4,990</span></div>
                    <button class="padd-btn" type="button">Add to Cart</button>
                </div>
            </div>
            <div class="pcard">
                <div class="pcard-img"><img src="Images/pick2.jpg" alt="Pick" /><button class="pwish" type="button">♡</button></div>
                <div class="pcard-body">
                    <p class="pname">boAt Rockerz 550</p>
                    <div class="prating">★★★★★ <span>4.6 (4K)</span></div>
                    <div class="ppricing"><span class="pprice">₹1,799</span><span class="pold">₹3,990</span></div>
                    <button class="padd-btn" type="button">Add to Cart</button>
                </div>
            </div>
            <div class="pcard">
                <div class="pcard-img"><img src="Images/pick3.jpg" alt="Pick" /><button class="pwish" type="button">♡</button></div>
                <div class="pcard-body">
                    <p class="pname">boAt Stone 1000</p>
                    <div class="prating">★★★★☆ <span>4.4 (2K)</span></div>
                    <div class="ppricing"><span class="pprice">₹2,499</span><span class="pold">₹4,990</span></div>
                    <button class="padd-btn" type="button">Add to Cart</button>
                </div>
            </div>
            <div class="pcard">
                <div class="pcard-img"><img src="Images/pick4.jpg" alt="Pick" /><button class="pwish" type="button">♡</button></div>
                <div class="pcard-body">
                    <p class="pname">boAt Wave Pro</p>
                    <div class="prating">★★★★★ <span>4.7 (6K)</span></div>
                    <div class="ppricing"><span class="pprice">₹2,999</span><span class="pold">₹7,990</span></div>
                    <button class="padd-btn" type="button">Add to Cart</button>
                </div>
            </div>
            <div class="pcard">
                <div class="pcard-img"><img src="Images/pick5.jpg" alt="Pick" /><button class="pwish" type="button">♡</button></div>
                <div class="pcard-body">
                    <p class="pname">boAt Rockerz 255</p>
                    <div class="prating">★★★★☆ <span>4.3 (5K)</span></div>
                    <div class="ppricing"><span class="pprice">₹1,499</span><span class="pold">₹3,990</span></div>
                    <button class="padd-btn" type="button">Add to Cart</button>
                </div>
            </div>
            <div class="pcard">
                <div class="pcard-img"><img src="Images/pick6.jpg" alt="Pick" /><button class="pwish" type="button">♡</button></div>
                <div class="pcard-body">
                    <p class="pname">boAt Airdopes 381</p>
                    <div class="prating">★★★★★ <span>4.6 (8K)</span></div>
                    <div class="ppricing"><span class="pprice">₹1,999</span><span class="pold">₹4,990</span></div>
                    <button class="padd-btn" type="button">Add to Cart</button>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ===== SHOP BY LIFESTYLE (Circles) ===== -->
<section class="section-wrap grey-wrap">
    <div class="section-container">
        <div class="section-header">
            <h2 class="section-title">Shop by Lifestyle</h2>
            <a href="#" class="view-all-link">View All →</a>
        </div>
        <div class="lifestyle-circles">
            <div class="lc-item">
                <div class="lc-circle">
                    <img src="Images/lifestyle1.jpg" alt="Fitness" />
                </div>
                <p>For Fitness</p>
            </div>
            <div class="lc-item">
                <div class="lc-circle">
                    <img src="Images/lifestyle2.jpg" alt="Parties" />
                </div>
                <p>For Parties</p>
            </div>
            <div class="lc-item">
                <div class="lc-circle">
                    <img src="Images/lifestyle3.jpg" alt="Work" />
                </div>
                <p>For Work</p>
            </div>
            <div class="lc-item">
                <div class="lc-circle">
                    <img src="Images/lifestyle4.jpg" alt="AudioPhiles" />
                </div>
                <p>For AudioPhiles</p>
            </div>
        </div>
    </div>
</section>

<!-- ===== BEST OF BOAT (New Launches) ===== -->
<div class="products-row">
    <asp:Repeater ID="rptNewArrivals" runat="server">
        <ItemTemplate>
            <div class="pcard">
                <div class="pcard-img">
                    <a href='ProductDetail.aspx?id=<%# Eval("ProductID") %>'>
                        <img src='<%# Eval("ImageURL") %>' alt='<%# Eval("ProductName") %>' />
                    </a>
                    <span class="pbadge new">NEW LAUNCH</span>
                    <button class="pwish" type="button">♡</button>
                </div>
                <div class="pcard-body">
                    <p class="pname"><%# Eval("ProductName") %></p>
                    <div class="prating">
                        <%# GetStars(Convert.ToDecimal(Eval("Rating"))) %>
                        <span><%# Eval("Rating") %></span>
                    </div>
                    <div class="ppricing">
                        <span class="pprice">₹<%# String.Format("{0:N0}", Eval("Price")) %></span>
                        <span class="pold">₹<%# String.Format("{0:N0}", Eval("OldPrice")) %></span>
                    </div>
                    <a href='ProductDetail.aspx?id=<%# Eval("ProductID") %>'
                       class="padd-btn"
                       style="display:block;text-align:center;padding:9px 0;text-decoration:none;">
                        Shop Now
                    </a>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
<!-- ===== JOIN THE TRIBE ===== -->
<section class="tribe-section">
    <div class="section-container">
        <h2 class="tribe-title">Join the Tribe 🎶</h2>
        <p class="tribe-sub">Join the #boAtheads &amp; stay updated with latest launches</p>
        <div class="tribe-grid">
            <video preload="none" loop="true" autoplay="true" playsinline="true" muted="true" mediatype="video" class="svelte-jk0m5r" jsonkey="LQpQ74Z2fP" issafari="false" isimagemedia="false" style="border-radius: 2px; object-fit: cover; object-position: center top; z-index: 1; border: 0px solid rgb(255, 255, 255); width: 100%; height: 100%; pointer-events: none;" src="https://www.boat-lifestyle.com/cdn/shop/files/quinn_wj3yj65nlj5wjjw3kolikmm0.mp4"></video>
            <video preload="none" loop="true" autoplay="true" playsinline="true" muted="true" mediatype="video" class="svelte-jk0m5r" jsonkey="LQpQ74Z2fP" issafari="false" isimagemedia="false" style="border-radius: 2px; object-fit: cover; object-position: center top; z-index: 1; border: 0px solid rgb(255, 255, 255); width: 100%; height: 100%;" src="https://www.boat-lifestyle.com/cdn/shop/files/quinn_iopw61jyiqp2ur4lkmb8v99z.mp4"></video>
            <video preload="none" loop="true" autoplay="true" playsinline="true" muted="true" mediatype="video" class="svelte-jk0m5r" jsonkey="LQpQ74Z2fP" issafari="false" isimagemedia="false" style="border-radius: 2px; object-fit: cover; object-position: center top; z-index: 1; border: 0px solid rgb(255, 255, 255); width: 100%; height: 100%;" src="https://www.boat-lifestyle.com/cdn/shop/files/quinn_zntjxmugklrk3vhl1fjxqr5g.mp4"></video>
            <video preload="none" loop="true" autoplay="true" playsinline="true" muted="true" mediatype="video" class="svelte-jk0m5r" jsonkey="LQpQ74Z2fP" issafari="false" isimagemedia="false" style="border-radius: 2px; object-fit: cover; object-position: center top; z-index: 1; border: 0px solid rgb(255, 255, 255); width: 100%; height: 100%;" src="https://www.boat-lifestyle.com/cdn/shop/files/quinn_krc7ksul4krxdnfhyr2cwhld.mp4"></video>
            <video preload="none" loop="true" autoplay="true" playsinline="true" muted="true" mediatype="video" class="svelte-jk0m5r" jsonkey="LQpQ74Z2fP" issafari="false" isimagemedia="false" style="border-radius: 2px; object-fit: cover; object-position: center top; z-index: 1; border: 0px solid rgb(255, 255, 255); width: 100%; height: 100%;" src="https://www.boat-lifestyle.com/cdn/shop/files/quinn_rc2jan2cq4z130ey73re7bau.mp4"></video>
        </div>
    </div>
</section>

<!-- ===== BLOGS ===== -->
<section class="section-wrap grey-wrap">
    <div class="section-container">
        <div class="section-header">
            <h2 class="section-title">Blogs 📖</h2>
            <div class="filter-tabs">
                <button class="ftab active" onclick="filterTab(this)">Popular</button>
                <button class="ftab" onclick="filterTab(this)">Latest</button>
                <button class="ftab" onclick="filterTab(this)">Reviews</button>
            </div>
            <a href="#" class="view-all-link">View All →</a>
        </div>
        <div class="blog-grid">
            <div class="blog-card">
                <div class="blog-img"><img src="Images/blog1.jpg" alt="Blog" /></div>
                <div class="blog-body">
                    <span class="blog-tag">Guide</span>
                    <h3>Buying Earbuds vs Headphones 101: Which One Suits You More?</h3>
                    <p>A detailed guide to help you choose between earbuds and headphones based on your lifestyle...</p>
                    <a href="#" class="blog-read">Read More →</a>
                </div>
            </div>
            <div class="blog-card">
                <div class="blog-img"><img src="Images/blog2.jpg" alt="Blog" /></div>
                <div class="blog-body">
                    <span class="blog-tag">Buying Guide</span>
                    <h3>The Complete Guide To Buying Wireless Earbuds</h3>
                    <p>Everything you need to know before making a purchase decision...</p>
                    <a href="#" class="blog-read">Read More →</a>
                </div>
            </div>
            <div class="blog-card">
                <div class="blog-img"><img src="Images/blog3.jpg" alt="Blog" /></div>
                <div class="blog-body">
                    <span class="blog-tag">Smartwatch</span>
                    <h3>The Chaos — A Fit Experience in Trendy Smartwatches</h3>
                    <p>Discover the best smartwatches for an active fitness-forward lifestyle...</p>
                    <a href="#" class="blog-read">Read More →</a>
                </div>
            </div>
            <div class="blog-card">
                <div class="blog-img"><img src="Images/blog4.jpg" alt="Blog" /></div>
                <div class="blog-body">
                    <span class="blog-tag">Review</span>
                    <h3>Best Workphones for Office Calls That Prevent Noise</h3>
                    <p>Top picks for noise-cancelling headphones perfect for remote work...</p>
                    <a href="#" class="blog-read">Read More →</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ===== IN THE PRESS ===== -->
<section class="section-wrap">
    <div class="section-container">
        <div class="section-header">
            <h2 class="section-title">In the Press</h2>
        </div>
        
        <div class="press-quote">
            <div class="pq-mark">"</div>
            <p class="pq-text">boAt is the first company from the consumer lifestyle electronics industry to collaborate with the BCCI to bring a full indigenous IP.</p>
            <p class="pq-src">— BusinessWorld</p>
        </div>
    </div>
</section>

<!-- ===== FOOTER ===== -->
<footer class="site-footer">
    <div class="footer-top">
        <div class="section-container">
            <div class="footer-grid">
                <!-- Brand + Newsletter -->
                <div class="footer-brand">
                    <div class="footer-logo">bo<span>A</span>t</div>
                    <p>Subscribe to our email alerts</p>
                    <div class="footer-newsletter">
                        <asp:TextBox ID="txtEmail" runat="server" placeholder="Email Address" CssClass="fnl-input"></asp:TextBox>
                        <asp:Button ID="btnSubscribe" runat="server" Text="Subscribe" CssClass="fnl-btn" />
                    </div>
                    <div class="footer-socials">
                        <a href="#" class="fsoc">f</a>
                        <a href="#" class="fsoc">in</a>
                        <a href="#" class="fsoc">tw</a>
                        <a href="#" class="fsoc">yt</a>
                        <a href="#" class="fsoc">ig</a>
                    </div>
                </div>

                <!-- Shop -->
                <div class="footer-col">
                    <h4>Shop</h4>
                    <ul>
                        <li><a href="#">True Wireless Earbuds</a></li>
                        <li><a href="#">Wireless Headphones</a></li>
                        <li><a href="#">Wired Headphones</a></li>
                        <li><a href="#">Wired Earphones</a></li>
                        <li><a href="#">Smart Watches</a></li>
                        <li><a href="#">Wireless Speakers</a></li>
                        <li><a href="#">Home Audio</a></li>
                        <li><a href="#">Accessories</a></li>
                    </ul>
                </div>

                <!-- Installments -->
                <div class="footer-col">
                    <h4>Installments</h4>
                    <ul>
                        <li><a href="#">Pay With EMI</a></li>
                        <li><a href="#">No Cost EMI</a></li>
                        <li><a href="#">Bank Offers</a></li>
                    </ul>
                    <h4 style="margin-top:20px;">Promotions</h4>
                    <ul>
                        <li><a href="#">Student Discount</a></li>
                        <li><a href="#">Corporate Deals</a></li>
                        <li><a href="#">Gifting Store</a></li>
                    </ul>
                </div>

                <!-- Assistance -->
                <div class="footer-col">
                    <h4>Assistance</h4>
                    <ul>
                        <li><a href="#">Track Order</a></li>
                        <li><a href="#">Warranty</a></li>
                        <li><a href="#">Return Policy</a></li>
                        <li><a href="#">FAQ</a></li>
                        <li><a href="#">Service Centers</a></li>
                        <li><a href="#">Contact Us</a></li>
                    </ul>
                </div>

                <!-- Wireless Earphones -->
                <div class="footer-col">
                    <h4>Wireless Earphones</h4>
                    <ul>
                        <li><a href="#">Airdopes 141</a></li>
                        <li><a href="#">Airdopes 161</a></li>
                        <li><a href="#">Airdopes 381</a></li>
                        <li><a href="#">Airdopes 800</a></li>
                    </ul>
                    <h4 style="margin-top:20px;">Company</h4>
                    <ul>
                        <li><a href="#">About boAt</a></li>
                        <li><a href="#">Careers</a></li>
                        <li><a href="#">Press</a></li>
                        <li><a href="#">Investors</a></li>
                    </ul>
                </div>

                <!-- Smart Watches -->
                <div class="footer-col">
                    <h4>Smart Watches</h4>
                    <ul>
                        <li><a href="#">Wave Call</a></li>
                        <li><a href="#">Wave Pro</a></li>
                        <li><a href="#">Wave Ultra</a></li>
                        <li><a href="#">Lunar Series</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <div class="section-container footer-bottom-inner">
            <p>© 2024 Imagine Marketing Limited. All Rights Reserved.</p>
            <div class="payment-methods">
                <span class="pm">VISA</span>
                <span class="pm">MC</span>
                <span class="pm">UPI</span>
                <span class="pm">GPay</span>
                <span class="pm">PayTM</span>
            </div>
            <div class="footer-links">
                <a href="#">Privacy Policy</a>
                <a href="#">Terms &amp; Conditions</a>
                <a href="#">Sitemap</a>
            </div>
        </div>
    </div>
</footer>

</form>

<script type="text/javascript">
    // ===== SLIDER =====
    let currentSlide = 0;
    const slides = document.querySelectorAll('.hero-slide');
    const dots = document.querySelectorAll('.sdot');

    function showSlide(n) {
        slides.forEach(s => s.classList.remove('active-slide'));
        dots.forEach(d => d.classList.remove('active-sdot'));
        currentSlide = (n + slides.length) % slides.length;
        slides[currentSlide].classList.add('active-slide');
        dots[currentSlide].classList.add('active-sdot');
    }
    function changeSlide(dir) { showSlide(currentSlide + dir); }
    function goSlide(n) { showSlide(n); }
    setInterval(() => changeSlide(1), 5000);

    // ===== FILTER TABS =====
    function filterTab(el) {
        const siblings = el.parentElement.querySelectorAll('.ftab');
        siblings.forEach(t => t.classList.remove('active'));
        el.classList.add('active');
    }

    // ===== WISHLIST TOGGLE =====
    document.querySelectorAll('.pwish').forEach(btn => {
        btn.addEventListener('click', function () {
            this.classList.toggle('wishlisted');
            this.textContent = this.classList.contains('wishlisted') ? '♥' : '♡';
        });
    });

    // ===== STICKY HEADER SHADOW =====
    window.addEventListener('scroll', () => {
        const header = document.querySelector('.main-header');
        header.style.boxShadow = window.scrollY > 10
            ? '0 4px 20px rgba(0,0,0,0.15)'
            : '0 2px 8px rgba(0,0,0,0.08)';
    });
</script>
</body>
</html>
