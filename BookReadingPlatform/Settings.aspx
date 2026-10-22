<%@ Page Title="Settings" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Settings.aspx.cs" Inherits="BookReadingPlatform.Settings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Header Styling */
        .header-top { display: flex; align-items: center; justify-content: space-between; margin-bottom: 25px; }
        .header-left { display: flex; align-items: center; gap: 15px; }
        .btn-back { width: 32px; height: 32px; border-radius: 50%; border: 1px solid #e2e8f0; display: flex; align-items: center; justify-content: center; color: #1a202c; text-decoration: none; }
        .btn-back svg { width: 16px; height: 16px; stroke: currentColor; fill: none; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }
        .header-top h2 { margin: 0; font-size: 20px; color: #1a202c; font-weight: 700; }
        
        .header-right { display: flex; gap: 10px; }
        .circle-btn { width: 36px; height: 36px; border-radius: 50%; background: #f8fafc; border: 1px solid #e2e8f0; display: flex; align-items: center; justify-content: center; color: #718096; cursor: pointer; }
        .circle-btn svg { width: 16px; height: 16px; stroke: currentColor; fill: none; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }

        /* Profile Card */
        .settings-profile { border: 1px solid #edf2f7; border-radius: 16px; padding: 20px; display: flex; align-items: center; margin-bottom: 30px; background: white; box-shadow: 0 1px 2px rgba(0,0,0,0.02); }
        .sp-avatar { width: 50px; height: 50px; background: #5c6ac4; color: white; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 18px; font-weight: 700; margin-right: 15px; }
        .sp-info h3 { margin: 0 0 2px 0; font-size: 16px; color: #1a202c; }
        .sp-info p { margin: 0; font-size: 12px; color: #a0aec0; }
        .sp-edit { margin-left: auto; color: #5c6ac4; font-size: 12px; font-weight: 600; text-decoration: none; }

        /* Settings Sections */
        .section-box { border: 1px solid #edf2f7; border-radius: 16px; padding: 20px 25px; background: white; margin-bottom: 20px; box-shadow: 0 1px 2px rgba(0,0,0,0.02); }
        .section-label { font-size: 10px; font-weight: 700; color: #a0aec0; letter-spacing: 1px; margin-bottom: 20px; display: block; text-transform: uppercase; }
        
        .setting-row { display: flex; align-items: center; justify-content: space-between; margin-bottom: 25px; }
        .setting-row:last-child { margin-bottom: 0; }
        .setting-name { font-size: 14px; color: #1a202c; font-weight: 500; }
        
        /* Interactive Toggle Switches */
        .toggle { width: 44px; height: 24px; background: #e2e8f0; border-radius: 12px; position: relative; cursor: pointer; transition: 0.3s; }
        .toggle.active { background: #5c6ac4; }
        .toggle-circle { width: 20px; height: 20px; background: white; border-radius: 50%; position: absolute; top: 2px; left: 2px; transition: 0.3s; box-shadow: 0 1px 2px rgba(0,0,0,0.1); }
        .toggle.active .toggle-circle { left: 22px; }
        
        /* Font Size Pills */
        .font-pills { display: flex; gap: 10px; }
        .pill { padding: 6px 16px; border: 1px solid #e2e8f0; border-radius: 20px; font-size: 12px; color: #718096; cursor: pointer; transition: all 0.2s; }
        .pill.active { border-color: #5c6ac4; color: #5c6ac4; font-weight: 600; background: #eff6ff; }
        
        /* Link Rows */
        .link-row { display: flex; align-items: center; justify-content: space-between; padding: 16px 0; border-bottom: 1px solid #f7fafc; text-decoration: none; color: #1a202c; font-size: 14px; font-weight: 500; }
        .link-row:last-child { border-bottom: none; padding-bottom: 0; }
        .link-row:first-child { padding-top: 0; }
        .link-row svg { width: 16px; height: 16px; stroke: #a0aec0; fill: none; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }
        
        /* Sign Out Button */
        .btn-signout { display: flex; align-items: center; justify-content: center; gap: 8px; width: 100%; padding: 14px; border: 1px solid #fed7d7; border-radius: 12px; background: white; color: #e53e3e; font-size: 14px; font-weight: 600; cursor: pointer; margin-top: 10px; text-decoration: none; }
        .btn-signout svg { width: 18px; height: 18px; stroke: currentColor; fill: none; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="header-top">
        <div class="header-left">
            <a href="Profile.aspx" class="btn-back">
                <svg viewBox="0 0 24 24"><polyline points="15 18 9 12 15 6"></polyline></svg>
            </a>
            <h2>Settings</h2>
        </div>
        <div class="header-right">
            <div class="circle-btn">
                <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
            </div>
            <div class="circle-btn">
                <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
            </div>
        </div>
    </div>

    <!-- Profile Summary Card -->
    <div class="settings-profile">
        <div class="sp-avatar">AS</div>
        <div class="sp-info">
            <h3>Arjun Sharma</h3>
            <p>arjun.sharma@example.com</p>
        </div>
        <a href="Profile.aspx" class="sp-edit">Edit Profile</a>
    </div>

    <!-- Appearance Settings -->
    <div class="section-box">
        <span class="section-label">Appearance</span>
        
        <div class="setting-row">
            <span class="setting-name">Dark Mode</span>
            <div id="darkModeToggle" class="toggle" onclick="toggleDarkMode()">
                <div class="toggle-circle"></div>
            </div>
        </div>
        
        <div class="setting-row">
            <span class="setting-name">Notifications</span>
            <div class="toggle active" onclick="this.classList.toggle('active')">
                <div class="toggle-circle"></div>
            </div>
        </div>
        
        <div class="setting-row" style="flex-direction: column; align-items: flex-start; gap: 15px;">
            <span class="setting-name">Font Size</span>
            <div class="font-pills">
                <div class="pill">Small</div>
                <div class="pill active">Medium (Default)</div>
                <div class="pill">Large</div>
                <div class="pill">Extra Large</div>
            </div>
        </div>
    </div>

    <!-- Links Section -->
    <div class="section-box">
        <a href="#" class="link-row">
            Help & Support
            <svg viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"></polyline></svg>
        </a>
        <a href="#" class="link-row">
            Privacy Policy
            <svg viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"></polyline></svg>
        </a>
        <a href="#" class="link-row">
            About App
            <svg viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"></polyline></svg>
        </a>
    </div>

    <a href="Login.aspx" class="btn-signout">
        <svg viewBox="0 0 24 24"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
        Sign Out
    </a>

 <script>
     // Set the toggle visual state on page load based on localStorage
     document.addEventListener("DOMContentLoaded", function () {
         if (localStorage.getItem('theme') === 'dark') {
             document.getElementById('darkModeToggle').classList.add('active');
         }
     });

     // Toggle Dark Mode function
     function toggleDarkMode() {
         const toggleBtn = document.getElementById('darkModeToggle');
         toggleBtn.classList.toggle('active');

         const isDark = toggleBtn.classList.contains('active');

         if (isDark) {
             document.body.classList.add('dark-theme');
             localStorage.setItem('theme', 'dark'); // Save preference
         } else {
             document.body.classList.remove('dark-theme');
             localStorage.setItem('theme', 'light'); // Save preference
         }
     }

     // Font Pills script
     document.querySelectorAll('.pill').forEach(pill => {
         pill.addEventListener('click', function () {
             document.querySelectorAll('.pill').forEach(p => p.classList.remove('active'));
             this.classList.add('active');
         });
     });
 </script>
</asp:Content>