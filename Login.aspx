<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BoatWebsite.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login - boAt Lifestyle</title>
    <link href="Content/boat-styles.css" rel="stylesheet" />
    <link href="Content/boat-auth.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        
        <!-- Top Banner -->
        <div class="top-banner">
            Get Extra 5% Off On Prepaid Orders | Code: <strong>BOATHEAD</strong>
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

        <!-- Login Section -->
        <div class="auth-container">
            <div class="auth-box">
                <div class="auth-header">
                    <h2>Welcome Back! 🎧</h2>
                    <p>Login to continue your audio journey</p>
                </div>

                <div class="auth-form">
                    
                    <!-- Error/Success Messages -->
                    <asp:Label ID="lblError" runat="server" CssClass="error-message" Visible="false"></asp:Label>
                    <asp:Label ID="lblSuccess" runat="server" CssClass="success-message" Visible="false"></asp:Label>

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
                    </div>

                    <!-- Password -->
                    <div class="form-group">
                        <label for="txtPassword">Password</label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" 
                                     placeholder="Enter your password" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                                   ControlToValidate="txtPassword"
                                                   ErrorMessage="Password is required" 
                                                   CssClass="validation-error"
                                                   Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Remember & Forgot -->
                    <div class="form-options">
                        <div class="remember-me">
                            <asp:CheckBox ID="chkRememberMe" runat="server" />
                            <label for="chkRememberMe">Remember Me</label>
                        </div>
                        <a href="#" class="forgot-link">Forgot Password?</a>
                    </div>

                    <!-- Login Button -->
                    <asp:Button ID="btnLogin" runat="server" Text="Login" 
                               CssClass="btn btn-primary btn-full" 
                               OnClick="btnLogin_Click" />

                    <!-- Divider -->
                    <div class="divider">
                        <span>OR</span>
                    </div>

                    <!-- Social Login -->
                    <div class="social-login">
                        <button type="button" class="btn-social btn-google">
                            <span>🔍</span> Continue with Google
                        </button>
                        <button type="button" class="btn-social btn-facebook">
                            <span>📘</span> Continue with Facebook
                        </button>
                    </div>

                    <!-- Sign Up Link -->
                    <div class="auth-footer">
                        <p>New to boAt? <a href="Signup.aspx">Create Account</a></p>
                    </div>

                </div>
            </div>

            <!-- Side Panel -->
            <div class="auth-side">
                <div class="side-content">
                    <h2>Join the boAt Lifestyle! 🚀</h2>
                    <ul class="benefits-list">
                        <li>✓ Exclusive member discounts</li>
                        <li>✓ Early access to new launches</li>
                        <li>✓ Track your orders easily</li>
                        <li>✓ 1-year warranty on all products</li>
                        <li>✓ Special birthday offers</li>
                    </ul>
                    <div class="stats">
                        <div class="stat-item">
                            <h3>5M+</h3>
                            <p>Happy Customers</p>
                        </div>
                        <div class="stat-item">
                            <h3>100+</h3>
                            <p>Products</p>
                        </div>
                        <div class="stat-item">
                            <h3>#1</h3>
                            <p>Audio Brand</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </form>
</body>
</html>