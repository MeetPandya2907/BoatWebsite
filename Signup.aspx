<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="BoatWebsite.Signup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up - boAt Lifestyle</title>
    <link href="Content/boat-styles.css" rel="stylesheet" />
    <link href="Content/boat-auth.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        
        <!-- Top Banner -->
        <div class="top-banner">
            Sign Up Now & Get FLAT ₹500 OFF on First Purchase!
        </div>

        <!-- Navigation -->
        <nav class="navbar">
            <div class="container">
                <div class="nav-wrapper">
                    <div class="logo">
                        <a href="Default.aspx"><h1>bo<span class="highlight">A</span>t</h1></a>
                    </div>
                    <div class="nav-actions">
                        <a href="Default.aspx" class="back-link">← Back to Home</a>
                    </div>
                </div>
            </div>
        </nav>

        <!-- Signup Section -->
        <div class="auth-container">
            <div class="auth-box signup-box">
                <div class="auth-header">
                    <h2>Create Your Account 🎉</h2>
                    <p>Join the boAthead community today!</p>
                </div>

                <div class="auth-form">
                    
                    <!-- Messages -->
                    <asp:Label ID="lblError" runat="server" CssClass="error-message" Visible="false"></asp:Label>
                    <asp:Label ID="lblSuccess" runat="server" CssClass="success-message" Visible="false"></asp:Label>

                    <!-- Full Name -->
                    <div class="form-group">
                        <label for="txtFullName">Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" 
                                     placeholder="Enter your full name"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFullName" runat="server" 
                                                   ControlToValidate="txtFullName"
                                                   ErrorMessage="Full name is required" 
                                                   CssClass="validation-error"
                                                   Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Email -->
                    <div class="form-group">
                        <label for="txtEmail">Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" 
                                     placeholder="Enter your email" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                                                   ControlToValidate="txtEmail"
                                                   ErrorMessage="Email is required" 
                                                   CssClass="validation-error"
                                                   Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server"
                                                       ControlToValidate="txtEmail"
                                                       ErrorMessage="Please enter valid email"
                                                       ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"
                                                       CssClass="validation-error"
                                                       Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>

                    <!-- Phone Number -->
                    <div class="form-group">
                        <label for="txtPhone">Phone Number</label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" 
                                     placeholder="10-digit mobile number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                                                   ControlToValidate="txtPhone"
                                                   ErrorMessage="Phone number is required" 
                                                   CssClass="validation-error"
                                                   Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPhone" runat="server"
                                                       ControlToValidate="txtPhone"
                                                       ErrorMessage="Please enter valid 10-digit number"
                                                       ValidationExpression="^[0-9]{10}$"
                                                       CssClass="validation-error"
                                                       Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>

                    <!-- Password -->
                    <div class="form-group">
                        <label for="txtPassword">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" 
                                     placeholder="Create a strong password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                                   ControlToValidate="txtPassword"
                                                   ErrorMessage="Password is required" 
                                                   CssClass="validation-error"
                                                   Display="Dynamic"></asp:RequiredFieldValidator>
                        <small class="form-hint">Minimum 6 characters</small>
                    </div>

                    <!-- Confirm Password -->
                    <div class="form-group">
                        <label for="txtConfirmPassword">Confirm Password</label>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" CssClass="form-control" 
                                     placeholder="Re-enter your password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvConfirmPassword" runat="server" 
                                                   ControlToValidate="txtConfirmPassword"
                                                   ErrorMessage="Please confirm password" 
                                                   CssClass="validation-error"
                                                   Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvPassword" runat="server"
                                             ControlToValidate="txtConfirmPassword"
                                             ControlToCompare="txtPassword"
                                             ErrorMessage="Passwords do not match"
                                             CssClass="validation-error"
                                             Display="Dynamic"></asp:CompareValidator>
                    </div>

                    <!-- Terms -->
                    <div class="form-group-checkbox">
                        <asp:CheckBox ID="chkTerms" runat="server" />
                        <label for="chkTerms">
                            I agree to boAt's <a href="#">Terms & Conditions</a> and <a href="#">Privacy Policy</a>
                        </label>
                    </div>

                    <!-- Newsletter -->
                    <div class="form-group-checkbox">
                        <asp:CheckBox ID="chkNewsletter" runat="server" Checked="true" />
                        <label for="chkNewsletter">
                            Send me exclusive offers and updates via email
                        </label>
                    </div>

                    <!-- Signup Button -->
                    <asp:Button ID="btnSignup" runat="server" Text="Create Account" 
                               CssClass="btn btn-primary btn-full" 
                               OnClick="btnSignup_Click" />

                    <!-- Divider -->
                    <div class="divider">
                        <span>OR</span>
                    </div>

                    <!-- Social Signup -->
                    <div class="social-login">
                        <button type="button" class="btn-social btn-google">
                            <span>🔍</span> Sign up with Google
                        </button>
                        <button type="button" class="btn-social btn-facebook">
                            <span>📘</span> Sign up with Facebook
                        </button>
                    </div>

                    <!-- Login Link -->
                    <div class="auth-footer">
                        <p>Already have an account? <a href="Login.aspx">Login Here</a></p>
                    </div>

                </div>
            </div>

            <!-- Side Panel -->
            <div class="auth-side">
                <div class="side-content">
                    <h2>Why Join boAt? 🎧</h2>
                    <div class="feature-list">
                        <div class="feature-item-auth">
                            <div class="feature-icon-auth">🎁</div>
                            <div>
                                <h4>Welcome Offer</h4>
                                <p>Get ₹500 OFF on your first purchase</p>
                            </div>
                        </div>
                        <div class="feature-item-auth">
                            <div class="feature-icon-auth">⚡</div>
                            <div>
                                <h4>Early Access</h4>
                                <p>Be the first to try new products</p>
                            </div>
                        </div>
                        <div class="feature-item-auth">
                            <div class="feature-icon-auth">💳</div>
                            <div>
                                <h4>Easy Checkout</h4>
                                <p>Save addresses and payment methods</p>
                            </div>
                        </div>
                        <div class="feature-item-auth">
                            <div class="feature-icon-auth">📦</div>
                            <div>
                                <h4>Order Tracking</h4>
                                <p>Track all your orders in one place</p>
                            </div>
                        </div>
                    </div>
                    <div class="trust-badges">
                        <p>✓ 100% Secure Checkout</p>
                        <p>✓ 1 Year Warranty</p>
                        <p>✓ Free Shipping</p>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>