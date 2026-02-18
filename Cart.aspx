<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BoatWebsite.Cart" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>My Cart - boAt</title>
    <link href="Content/boat-styles.css" rel="stylesheet" />
    <link href="Content/cart.css" rel="stylesheet" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="https://fonts.googleapis.com/css2?family=Barlow:wght@400;500;600;700;800;900&family=Barlow+Condensed:wght@700;800;900&display=swap" rel="stylesheet" />
</head>
<body>
<form id="form1" runat="server">

<!-- TOP BAR -->
<div class="top-promo-bar">
    <span>🎉 Get Extra 5% Off On Prepaid Orders | Code: <strong>BOATHEAD</strong></span>
</div>

<!-- HEADER -->
<header class="main-header">
    <div class="header-inner">
        <div class="brand-logo"><a href="Default.aspx">bo<span>A</span>t</a></div>
        <nav class="main-nav">
            <a href="Default.aspx" class="nav-link">← Continue Shopping</a>
        </nav>
        <div class="header-right">
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
                <span class="cart-count"><%: cartItemCount %></span>
            </a>
        </div>
    </div>
</header>

<!-- CART PAGE BODY -->
<div class="cart-page-wrap">
    <div class="section-container">
        <h1 class="cart-page-title">My Cart <span class="cart-title-count">(<%: cartItemCount %> items)</span></h1>

        <!-- EMPTY CART -->
        <asp:Panel ID="pnlEmpty" runat="server" Visible="false" CssClass="empty-cart">
            <div class="empty-cart-icon">🛒</div>
            <h2>Your cart is empty!</h2>
            <p>Looks like you haven't added anything yet.</p>
            <a href="Default.aspx" class="btn-shop-now">Start Shopping →</a>
        </asp:Panel>

        <!-- CART CONTENT -->
        <asp:Panel ID="pnlCart" runat="server">
        <div class="cart-layout">

            <!-- LEFT: Cart Items -->
            <div class="cart-items-col">
                <!-- Coupon Bar -->
                <div class="coupon-bar">
                    <input type="text" id="txtCoupon" placeholder="Enter coupon code (e.g. BOATHEAD)" class="coupon-input" />
                    <button type="button" class="coupon-apply-btn" onclick="applyCoupon()">Apply</button>
                </div>
                <div class="coupon-msg" id="couponMsg"></div>

                <!-- Cart Items Repeater -->
                <div class="cart-items-list">
                    <asp:Repeater ID="rptCart" runat="server" OnItemCommand="rptCart_ItemCommand">
                        <HeaderTemplate>
                            <div class="cart-header-row">
                                <span>Product</span>
                                <span>Price</span>
                                <span>Quantity</span>
                                <span>Total</span>
                                <span>Remove</span>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="cart-item-row">
                                <!-- Product Image + Name -->
                                <div class="cart-item-info">
                                    <a href='ProductDetail.aspx?id=<%# Eval("ProductID") %>'>
                                        <img src='<%# Eval("ImageURL") %>' alt='<%# Eval("ProductName") %>' class="cart-item-img" />
                                    </a>
                                    <div class="cart-item-details">
                                        <a href='ProductDetail.aspx?id=<%# Eval("ProductID") %>' class="cart-item-name"><%# Eval("ProductName") %></a>
                                        <p class="cart-item-meta">1 Year Warranty | Type-C Charging</p>
                                        <span class="cart-item-instock">✓ In Stock</span>
                                    </div>
                                </div>

                                <!-- Price -->
                                <div class="cart-col-price">
                                    <span class="cart-price">₹<%# String.Format("{0:N0}", Eval("Price")) %></span>
                                    <span class="cart-old-price">₹<%# String.Format("{0:N0}", Eval("OldPrice")) %></span>
                                </div>

                                <!-- Quantity -->
                                <div class="cart-col-qty">
                                    <div class="cart-qty-ctrl">
                                        <asp:LinkButton ID="btnDecQty" runat="server"
                                            CommandName="DecQty"
                                            CommandArgument='<%# Eval("CartID") %>'
                                            CssClass="cqty-btn">−</asp:LinkButton>
                                        <span class="cqty-num"><%# Eval("Quantity") %></span>
                                        <asp:LinkButton ID="btnIncQty" runat="server"
                                            CommandName="IncQty"
                                            CommandArgument='<%# Eval("CartID") %>'
                                            CssClass="cqty-btn">+</asp:LinkButton>
                                    </div>
                                </div>

                                <!-- Total -->
                                <div class="cart-col-total">
                                    <span class="cart-total-price">₹<%# String.Format("{0:N0}", (decimal)Eval("Price") * (int)Eval("Quantity")) %></span>
                                </div>

                                <!-- Remove -->
                                <div class="cart-col-remove">
                                    <asp:LinkButton ID="btnRemove" runat="server"
                                        CommandName="Remove"
                                        CommandArgument='<%# Eval("CartID") %>'
                                        CssClass="cart-remove-btn"
                                        OnClientClick="return confirm('Remove this item?')">✕</asp:LinkButton>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <!-- RIGHT: Order Summary -->
            <div class="cart-summary-col">
                <div class="order-summary-box">
                    <h2 class="summary-title">Order Summary</h2>

                    <div class="summary-row">
                        <span>Subtotal (<asp:Literal ID="litItemCount" runat="server"></asp:Literal> items)</span>
                        <span>₹<asp:Literal ID="litSubtotal" runat="server"></asp:Literal></span>
                    </div>
                    <div class="summary-row">
                        <span>Discount</span>
                        <span class="summary-discount">− ₹<asp:Literal ID="litDiscount" runat="server"></asp:Literal></span>
                    </div>
                    <div class="summary-row">
                        <span>Delivery Charges</span>
                        <span class="summary-free"><asp:Literal ID="litDelivery" runat="server"></asp:Literal></span>
                    </div>
                    <div class="summary-divider"></div>
                    <div class="summary-row total-row">
                        <span>Total Amount</span>
                        <span>₹<asp:Literal ID="litTotal" runat="server"></asp:Literal></span>
                    </div>
                    <div class="summary-savings">
                        🎉 You save <strong>₹<asp:Literal ID="litSavings" runat="server"></asp:Literal></strong> on this order!
                    </div>

                    <asp:Button ID="btnCheckout" runat="server" Text="Proceed to Checkout →"
                        CssClass="btn-checkout" OnClick="btnCheckout_Click" />

                    <div class="secure-badge">🔒 100% Secure Checkout</div>

                    <div class="payment-opts">
                        <span class="pm">VISA</span>
                        <span class="pm">MC</span>
                        <span class="pm">UPI</span>
                        <span class="pm">GPay</span>
                        <span class="pm">PayTM</span>
                    </div>
                </div>

                <!-- Trust Box -->
                <div class="cart-trust-box">
                    <div class="cart-trust-item">✅ Free delivery above ₹499</div>
                    <div class="cart-trust-item">🔄 Easy 7-day returns</div>
                    <div class="cart-trust-item">🛡️ 1 Year warranty on all products</div>
                    <div class="cart-trust-item">📦 Delivery in 2-5 business days</div>
                </div>
            </div>
        </div>
        </asp:Panel>

        <!-- RECENTLY VIEWED / SUGGESTED -->
        <div class="cart-suggest-section">
            <h2 class="section-title">You Might Also Like</h2>
            <div class="products-row">
                <asp:Repeater ID="rptSuggest" runat="server">
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

<!-- FOOTER -->
<footer class="site-footer">
    <div class="footer-bottom">
        <div class="section-container footer-bottom-inner">
            <p>© 2024 Imagine Marketing Limited. All Rights Reserved.</p>
            <div class="footer-links"><a href="#">Privacy Policy</a><a href="#">Terms &amp; Conditions</a></div>
        </div>
    </div>
</footer>

</form>
<script type="text/javascript">
    function applyCoupon() {
        var code = document.getElementById('txtCoupon').value.trim().toUpperCase();
        var msg = document.getElementById('couponMsg');
        if (code === 'BOATHEAD') {
            msg.innerHTML = '<span style="color:#22c55e;">✓ Coupon applied! 5% extra discount added.</span>';
        } else if (code === '') {
            msg.innerHTML = '<span style="color:#e63946;">Please enter a coupon code.</span>';
        } else {
            msg.innerHTML = '<span style="color:#e63946;">Invalid coupon code. Try BOATHEAD.</span>';
        }
    }
</script>
</body>
</html>
