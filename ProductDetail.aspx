<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="BoatWebsite.ProductDetail" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title runat="server" id="pageTitle">Product - boAt</title>
    <link href="Content/boat-styles.css" rel="stylesheet" />
    <link href="Content/product-detail.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Barlow:wght@400;500;600;700;800;900&family=Barlow+Condensed:wght@700;800;900&display=swap" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">

<!-- TOP BAR -->
<div class="top-promo-bar">
    <span>🎉 Get Extra 5% Off On Prepaid Orders | Code: <strong>BOATHEAD</strong></span>
    <span class="promo-sep">|</span>
    <a href="#">Free Shipping on orders above ₹499</a>
</div>

<!-- HEADER -->
<header class="main-header">
    <div class="header-inner">
        <div class="brand-logo"><a href="Default.aspx">bo<span>A</span>t</a></div>
        <nav class="main-nav">
            <a href="#" class="nav-link">Categories</a>
            <a href="#" class="nav-link">boAt Personalisation</a>
            <a href="#" class="nav-link">Corporate Orders</a>
            <a href="#" class="nav-link">Gifting Store</a>
        </nav>
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
                    <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
                    <span><%: Session["FullName"] %></span>
                </button>
                <div class="user-drop-menu">
                    <a href="#">My Orders</a>
                    <a href="Default.aspx?logout=1" class="logout-link">Logout</a>
                </div>
            </div>
            <% } else { %>
            <a href="Login.aspx" class="hdr-icon-btn">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"/><circle cx="12" cy="7" r="4"/></svg>
            </a>
            <% } %>
            <a href="Cart.aspx" class="hdr-icon-btn cart-btn">
                <svg width="22" height="22" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><circle cx="9" cy="21" r="1"/><circle cx="20" cy="21" r="1"/><path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"/></svg>
                <span class="cart-count" id="cartCountBadge"><%: cartCount %></span>
            </a>
        </div>
    </div>
</header>

<!-- BREADCRUMB -->
<div class="breadcrumb-bar">
    <div class="section-container">
        <nav class="breadcrumb">
            <a href="Default.aspx">Home</a>
            <span>›</span>
            <asp:Literal ID="litCategory" runat="server"></asp:Literal>
            <span>›</span>
            <asp:Literal ID="litProductName" runat="server"></asp:Literal>
        </nav>
    </div>
</div>

<!-- ERROR PANEL -->
<asp:Panel ID="pnlError" runat="server" Visible="false">
    <div class="section-container" style="padding-top:40px;padding-bottom:40px;text-align:center;">
        <h2>Product not found</h2>
        <a href="Default.aspx" class="btn-back-home">← Back to Home</a>
    </div>
</asp:Panel>

<!-- PRODUCT DETAIL -->
<asp:Panel ID="pnlProduct" runat="server">
<div class="pd-wrap">
    <div class="section-container">
        <div class="pd-grid">

            <!-- LEFT: Images -->
            <div class="pd-images">
                <div class="pd-main-img">
                    <asp:Image ID="imgMain" runat="server" CssClass="main-product-img" AlternateText="Product" />
                    <asp:Label ID="lblDiscount" runat="server" CssClass="pd-discount-badge"></asp:Label>
                </div>
                <div class="pd-thumbs">
                    <div class="thumb active-thumb">
                        <asp:Image ID="imgThumb1" runat="server" CssClass="thumb-img" />
                    </div>
                    <div class="thumb">
                        <asp:Image ID="imgThumb2" runat="server" CssClass="thumb-img" />
                    </div>
                    <div class="thumb">
                        <asp:Image ID="imgThumb3" runat="server" CssClass="thumb-img" />
                    </div>
                </div>
            </div>

            <!-- RIGHT: Info -->
            <div class="pd-info">
                <asp:Label ID="lblNewBadge" runat="server" CssClass="pd-new-badge" Visible="false">NEW LAUNCH</asp:Label>
                <h1 class="pd-title"><asp:Literal ID="litTitle" runat="server"></asp:Literal></h1>

                <!-- Rating -->
                <div class="pd-rating-row">
                    <div class="pd-stars"><asp:Literal ID="litStars" runat="server"></asp:Literal></div>
                    <span class="pd-rating-num"><asp:Literal ID="litRating" runat="server"></asp:Literal></span>
                    <span class="pd-review-count">(<asp:Literal ID="litReviews" runat="server"></asp:Literal> reviews)</span>
                </div>

                <!-- Price -->
                <div class="pd-price-block">
                    <span class="pd-price"><asp:Literal ID="litPrice" runat="server"></asp:Literal></span>
                    <span class="pd-old-price"><asp:Literal ID="litOldPrice" runat="server"></asp:Literal></span>
                    <span class="pd-save-tag"><asp:Literal ID="litSave" runat="server"></asp:Literal></span>
                </div>

                <!-- Key Features -->
                <div class="pd-features">
                    <h3>Key Features</h3>
                    <ul class="pd-feat-list">
                        <li>✓ 1 Year Warranty</li>
                        <li>✓ ASAP Charge Technology</li>
                        <li>✓ IPX4 Water Resistant</li>
                        <li>✓ Voice Assistant Compatible</li>
                        <li>✓ Type-C Charging</li>
                    </ul>
                </div>

                <!-- Description -->
                <div class="pd-desc">
                    <asp:Literal ID="litDesc" runat="server"></asp:Literal>
                </div>

                <!-- Quantity -->
                <div class="pd-qty-row">
                    <label class="pd-qty-lbl">Quantity:</label>
                    <div class="pd-qty-ctrl">
                        <button type="button" class="qty-btn" onclick="changeQty(-1)">−</button>
                        <asp:TextBox ID="txtQty" runat="server" Text="1" CssClass="qty-input" ReadOnly="true"></asp:TextBox>
                        <button type="button" class="qty-btn" onclick="changeQty(1)">+</button>
                    </div>
                </div>

                <!-- Stock -->
                <asp:Label ID="lblStock" runat="server" CssClass="pd-stock-ok">✓ In Stock — Ready to Ship</asp:Label>

                <!-- Action Buttons -->
                <div class="pd-actions">
                    <asp:Button ID="btnAddToCart" runat="server" Text="🛒 Add to Cart"
                        CssClass="btn-add-cart" OnClick="btnAddToCart_Click" />
                    <asp:Button ID="btnBuyNow" runat="server" Text="⚡ Buy Now"
                        CssClass="btn-buy-now" OnClick="btnBuyNow_Click" />
                    <button type="button" class="btn-wishlist" title="Add to Wishlist">♡</button>
                </div>

                <!-- Message -->
                <asp:Label ID="lblCartMsg" runat="server" CssClass="cart-msg" Visible="false"></asp:Label>

                <!-- Trust Badges -->
                <div class="pd-trust">
                    <div class="trust-item">🚚 <span>Free Delivery</span></div>
                    <div class="trust-item">🔄 <span>Easy Returns</span></div>
                    <div class="trust-item">🛡️ <span>1 Year Warranty</span></div>
                    <div class="trust-item">💳 <span>Secure Payment</span></div>
                </div>
            </div>
        </div>

        <!-- DESCRIPTION TABS -->
        <div class="pd-tabs">
            <div class="tab-headers">
                <button class="tab-hdr active" onclick="switchTab(this,'desc')" type="button">Description</button>
                <button class="tab-hdr" onclick="switchTab(this,'specs')" type="button">Specifications</button>
                <button class="tab-hdr" onclick="switchTab(this,'reviews')" type="button">Reviews</button>
            </div>
            <div class="tab-body" id="desc">
                <p><asp:Literal ID="litDescFull" runat="server"></asp:Literal></p>
                <div class="spec-highlights">
                    <div class="sh-item"><span class="sh-icon">🎧</span><span>Premium Sound Quality</span></div>
                    <div class="sh-item"><span class="sh-icon">🔋</span><span>Long Battery Life</span></div>
                    <div class="sh-item"><span class="sh-icon">💧</span><span>Water Resistant</span></div>
                    <div class="sh-item"><span class="sh-icon">🎙️</span><span>Clear Mic Quality</span></div>
                </div>
            </div>
            <div class="tab-body hidden" id="specs">
                <table class="specs-table">
                    <tr><th>Brand</th><td>boAt</td></tr>
                    <tr><th>Warranty</th><td>1 Year</td></tr>
                    <tr><th>Connectivity</th><td>Bluetooth 5.0</td></tr>
                    <tr><th>Battery</th><td>Up to 40 Hours Total</td></tr>
                    <tr><th>Water Resistance</th><td>IPX4</td></tr>
                    <tr><th>Charging</th><td>Type-C</td></tr>
                    <tr><th>Driver Size</th><td>8mm</td></tr>
                    <tr><th>Color</th><td>Multiple options</td></tr>
                </table>
            </div>
            <div class="tab-body hidden" id="reviews">
                <div class="reviews-summary">
                    <div class="rev-score"><asp:Literal ID="litRevScore" runat="server"></asp:Literal></div>
                    <div class="rev-bars">
                        <div class="rbar"><span>5★</span><div class="rbar-track"><div class="rbar-fill" style="width:70%"></div></div><span>70%</span></div>
                        <div class="rbar"><span>4★</span><div class="rbar-track"><div class="rbar-fill" style="width:18%"></div></div><span>18%</span></div>
                        <div class="rbar"><span>3★</span><div class="rbar-track"><div class="rbar-fill" style="width:7%"></div></div><span>7%</span></div>
                        <div class="rbar"><span>2★</span><div class="rbar-track"><div class="rbar-fill" style="width:3%"></div></div><span>3%</span></div>
                        <div class="rbar"><span>1★</span><div class="rbar-track"><div class="rbar-fill" style="width:2%"></div></div><span>2%</span></div>
                    </div>
                </div>
                <div class="sample-reviews">
                    <div class="rev-card"><div class="rev-header"><strong>Rahul S.</strong><span class="rev-stars">★★★★★</span><span class="rev-date">Jan 2024</span></div><p>Amazing sound quality! Best earbuds under 2K. Battery life is excellent.</p></div>
                    <div class="rev-card"><div class="rev-header"><strong>Priya M.</strong><span class="rev-stars">★★★★☆</span><span class="rev-date">Feb 2024</span></div><p>Great value for money. Comfortable fit, good bass. Highly recommended!</p></div>
                    <div class="rev-card"><div class="rev-header"><strong>Amit K.</strong><span class="rev-stars">★★★★★</span><span class="rev-date">Mar 2024</span></div><p>Excellent product. Call quality is crystal clear. Delivered in 2 days!</p></div>
                </div>
            </div>
        </div>

        <!-- RELATED PRODUCTS -->
        <div class="related-section">
            <h2 class="section-title">You May Also Like</h2>
            <div class="products-row" id="relatedRow">
                <asp:Repeater ID="rptRelated" runat="server">
                    <ItemTemplate>
                        <div class="pcard">
                            <div class="pcard-img">
                                <a href='ProductDetail.aspx?id=<%# Eval("ProductID") %>'>
                                    <img src='<%# Eval("ImageURL") %>' alt='<%# Eval("ProductName") %>' />
                                </a>
                                <% if ((int)Eval("Discount") > 0) { %>
                                <span class="pbadge sale"><%# Eval("Discount") %>% Off</span>
                                <% } %>
                            </div>
                            <div class="pcard-body">
                                <p class="pname"><%# Eval("ProductName") %></p>
                                <div class="prating"><%# GetStars((decimal)Eval("Rating")) %> <span><%# Eval("Rating") %></span></div>
                                <div class="ppricing">
                                    <span class="pprice">₹<%# String.Format("{0:N0}", Eval("Price")) %></span>
                                    <span class="pold">₹<%# String.Format("{0:N0}", Eval("OldPrice")) %></span>
                                </div>
                                <a href='ProductDetail.aspx?id=<%# Eval("ProductID") %>' class="padd-btn" style="display:block;text-align:center;padding:9px 0;text-decoration:none;">View Product</a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>
</div>
</asp:Panel>

<!-- FOOTER (minimal) -->
<footer class="site-footer" style="margin-top:0;">
    <div class="footer-bottom">
        <div class="section-container footer-bottom-inner">
            <p>© 2024 Imagine Marketing Limited. All Rights Reserved.</p>
            <div class="footer-links"><a href="#">Privacy Policy</a><a href="#">Terms &amp; Conditions</a></div>
        </div>
    </div>
</footer>

</form>

<script type="text/javascript">
    // Tab switching
    function switchTab(btn, tabId) {
        document.querySelectorAll('.tab-hdr').forEach(b => b.classList.remove('active'));
        document.querySelectorAll('.tab-body').forEach(t => t.classList.add('hidden'));
        btn.classList.add('active');
        document.getElementById(tabId).classList.remove('hidden');
    }

    // Quantity control
    function changeQty(delta) {
        var inp = document.querySelector('.qty-input');
        var val = parseInt(inp.value) + delta;
        if (val < 1) val = 1;
        if (val > 10) val = 10;
        inp.value = val;
    }

    // Thumbnail click
    document.querySelectorAll('.thumb').forEach(function(t) {
        t.addEventListener('click', function() {
            document.querySelectorAll('.thumb').forEach(x => x.classList.remove('active-thumb'));
            this.classList.add('active-thumb');
            var src = this.querySelector('.thumb-img').src;
            document.querySelector('.main-product-img').src = src;
        });
    });

    // Wishlist toggle
    var wb = document.querySelector('.btn-wishlist');
    if (wb) {
        wb.addEventListener('click', function() {
            this.classList.toggle('active');
            this.textContent = this.classList.contains('active') ? '♥' : '♡';
        });
    }
</script>
</body>
</html>
