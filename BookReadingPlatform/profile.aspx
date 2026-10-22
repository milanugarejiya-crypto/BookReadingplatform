<%@ Page Title="Profile" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="BookReadingPlatform.Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Header Styling */
        .header-top { display: flex; align-items: center; justify-content: space-between; margin-bottom: 25px; }
        .header-left { display: flex; align-items: center; }
        .header-dots { display: flex; gap: 6px; margin-right: 15px; }
        .dot { width: 8px; height: 8px; border-radius: 50%; }
        .dot-red { background-color: #fc8181; }
        .dot-yellow { background-color: #f6e05e; }
        .dot-green { background-color: #68d391; }
        .header-top h2 { margin: 0; font-size: 18px; color: #1a202c; font-weight: 700; letter-spacing: -0.2px; }
        
        .header-right { display: flex; gap: 10px; }
        .circle-btn { width: 36px; height: 36px; border-radius: 50%; background: #f8fafc; border: 1px solid #e2e8f0; display: flex; align-items: center; justify-content: center; color: #718096; cursor: pointer; }
        .circle-btn svg { width: 16px; height: 16px; fill: none; stroke: currentColor; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }

        /* Top Profile Card */
        .profile-header-card {
            background: #ffffff;
            border-radius: 16px;
            padding: 25px;
            display: flex;
            align-items: center;
            border: 1px solid #edf2f7;
            box-shadow: 0 2px 4px rgba(0,0,0,0.02);
            margin-bottom: 25px;
            position: relative;
        }
        
        .profile-avatar {
            width: 75px;
            height: 75px;
            background-color: #5c6ac4;
            border-radius: 18px;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-size: 24px;
            font-weight: 700;
            margin-right: 25px;
            flex-shrink: 0;
        }
        
        .profile-details { display: flex; flex-direction: column; justify-content: center; }
        .profile-details h3 { margin: 0 0 4px 0; font-size: 20px; color: #1a202c; font-weight: 700; }
        .profile-details p { margin: 0 0 10px 0; font-size: 13px; color: #a0aec0; }
        
        /* Updated Premium Badge to match blue theme */
        .premium-badge {
            background: #eff6ff;
            color: #5c6ac4;
            padding: 4px 12px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: 600;
            display: inline-block;
            width: fit-content;
        }

        .btn-edit {
            position: absolute;
            right: 25px;
            top: 25px;
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            color: #5c6ac4;
            text-decoration: none;
            padding: 8px 20px;
            border-radius: 20px;
            font-size: 13px;
            font-weight: 600;
            transition: all 0.2s;
            cursor: pointer;
        }
        .btn-edit:hover { background: #eff6ff; }

        /* Stats Grid */
        .stats-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-bottom: 30px; }
        .stat-card { background: #ffffff; border-radius: 16px; padding: 25px 20px; text-align: center; border: 1px solid #edf2f7; box-shadow: 0 2px 4px rgba(0,0,0,0.02); }
        .stat-card h4 { margin: 0 0 5px 0; font-size: 28px; color: #5c6ac4; font-weight: 700; }
        .stat-card span { font-size: 12px; color: #a0aec0; font-weight: 500; }

        /* Links List */
        .menu-list-container { background: #ffffff; border-radius: 16px; border: 1px solid #edf2f7; box-shadow: 0 2px 4px rgba(0,0,0,0.02); overflow: hidden; margin-bottom: 40px; }
        .menu-item { display: flex; align-items: center; padding: 18px 25px; text-decoration: none; border-bottom: 1px solid #f7fafc; cursor: pointer; transition: background 0.2s; }
        .menu-item:hover { background: #f8fafc; }
        .menu-item:last-child { border-bottom: none; }
        
        .menu-icon-box { width: 38px; height: 38px; background: #eff6ff; border-radius: 10px; display: flex; align-items: center; justify-content: center; margin-right: 18px; }
        .menu-icon-box svg { width: 18px; height: 18px; stroke: #5c6ac4; fill: none; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }
        .menu-text { font-size: 14px; font-weight: 600; color: #1a202c; flex-grow: 1; }
        .menu-chevron { width: 16px; height: 16px; stroke: #cbd5e1; fill: none; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }
        
        .menu-item.logout .menu-icon-box { background: #fef2f2; }
        .menu-item.logout .menu-icon-box svg { stroke: #e53e3e; }
        .menu-item.logout .menu-text { color: #e53e3e; }

        /* Modal Overlay */
        .modal-overlay {
            position: fixed; top: 0; left: 0; width: 100%; height: 100%;
            background: rgba(15, 23, 42, 0.4); 
            backdrop-filter: blur(2px);
            display: none; 
            justify-content: center; align-items: center; z-index: 1000;
        }
        .modal-content {
            background: #ffffff; border-radius: 20px; padding: 30px; width: 100%; max-width: 450px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1); box-sizing: border-box;
        }
        .modal-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 25px; }
        .modal-header h2 { margin: 0; font-size: 18px; color: #1a202c; font-weight: 700; }
        .btn-close-modal {
            background: #f8fafc; border: 1px solid #e2e8f0; border-radius: 50%; width: 32px; height: 32px;
            display: flex; align-items: center; justify-content: center; cursor: pointer; color: #718096;
        }
        .btn-close-modal svg { width: 14px; height: 14px; stroke: currentColor; stroke-width: 2; fill: none; }
        
        .input-group { margin-bottom: 16px; }
        .input-group label { display: block; font-size: 12px; color: #4a5568; margin-bottom: 6px; }
        .input-control {
            width: 100%; padding: 12px 15px; border: 1px solid #e2e8f0; border-radius: 12px;
            font-size: 14px; color: #1a202c; box-sizing: border-box; outline: none;
        }
        .input-control:focus { border-color: #5c6ac4; }
        
        .modal-footer { display: flex; justify-content: flex-end; gap: 12px; margin-top: 30px; }
        .btn-cancel {
            background: #ffffff; border: 1px solid #e2e8f0; color: #4a5568;
            padding: 10px 24px; border-radius: 24px; font-weight: 600; font-size: 13px; cursor: pointer;
        }
        .btn-save {
            background: #5c6ac4; border: none; color: #ffffff;
            padding: 10px 24px; border-radius: 24px; font-weight: 600; font-size: 13px; cursor: pointer;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header -->
    <div class="header-top">
        <div class="header-left">
            <div class="header-dots">
                <div class="dot dot-red"></div>
                <div class="dot dot-yellow"></div>
                <div class="dot dot-green"></div>
            </div>
            <h2>Profile</h2>
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

    <!-- Profile Header Card -->
    <div class="profile-header-card">
        <div class="profile-avatar">AS</div>
        <div class="profile-details">
            <h3>Arjun Sharma</h3>
            <p>arjun.sharma@example.com</p>
            <div class="premium-badge">Premium Member</div>
        </div>
        <a onclick="openEditModal()" class="btn-edit">Edit</a>
    </div>

    <!-- Stats Grid -->
    <div class="stats-grid">
        <div class="stat-card">
            <h4>12</h4>
            <span>Books Read</span>
        </div>
        <div class="stat-card">
            <h4>4</h4>
            <span>In Progress</span>
        </div>
        <div class="stat-card">
            <h4>28</h4>
            <span>Bookmarked</span>
        </div>
    </div>

    <!-- Menu List -->
    <div class="menu-list-container">
        
        <a onclick="openEditModal()" class="menu-item">
            <div class="menu-icon-box">
                <svg viewBox="0 0 24 24"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>
            </div>
            <span class="menu-text">Edit Profile</span>
            <svg class="menu-chevron" viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"></polyline></svg>
        </a>

      <a href="MyLibrary.aspx" class="menu-item">
            <div class="menu-icon-box">
                <svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
            </div>
            <span class="menu-text">My Library</span>
            <svg class="menu-chevron" viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"></polyline></svg>
        </a>

        <a href="Favorites.aspx" class="menu-item">
            <div class="menu-icon-box">
                <svg viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg>
            </div>
            <span class="menu-text">Favorites</span>
            <svg class="menu-chevron" viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"></polyline></svg>
        </a>

        <a href="History.aspx" class="menu-item">
            <div class="menu-icon-box">
                <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
            </div>
            <span class="menu-text">Reading History</span>
            <svg class="menu-chevron" viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"></polyline></svg>
        </a>

        <a href="Downloads.aspx" class="menu-item">
            <div class="menu-icon-box">
                <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="7 10 12 15 17 10"></polyline><line x1="12" y1="15" x2="12" y2="3"></line></svg>
            </div>
            <span class="menu-text">Downloads</span>
            <svg class="menu-chevron" viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"></polyline></svg>
        </a>

        <!-- We mapped Change Password to open the modal in the previous step -->
        <a onclick="openPasswordModal()" class="menu-item">
            <div class="menu-icon-box">
                <svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
            </div>
            <span class="menu-text">Change Password</span>
            <svg class="menu-chevron" viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"></polyline></svg>
        </a>

        <a href="Settings.aspx" class="menu-item">
            <div class="menu-icon-box">
                <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
            </div>
            <span class="menu-text">Settings</span>
            <svg class="menu-chevron" viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"></polyline></svg>
        </a>

        <a href="#" class="menu-item">
            <div class="menu-icon-box">
                <svg viewBox="0 0 24 24"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="7 10 12 15 17 10"></polyline><line x1="12" y1="15" x2="12" y2="3"></line></svg>
            </div>
            <span class="menu-text">Downloads</span>
            <svg class="menu-chevron" viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"></polyline></svg>
        </a>

        <a href="#" class="menu-item">
            <div class="menu-icon-box">
                <svg viewBox="0 0 24 24"><rect x="3" y="11" width="18" height="11" rx="2" ry="2"></rect><path d="M7 11V7a5 5 0 0 1 10 0v4"></path></svg>
            </div>
            <span class="menu-text">Change Password</span>
            <svg class="menu-chevron" viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"></polyline></svg>
        </a>

        <a href="#" class="menu-item">
            <div class="menu-icon-box">
                <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
            </div>
            <span class="menu-text">Settings</span>
            <svg class="menu-chevron" viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"></polyline></svg>
        </a>

        <a href="Login.aspx" class="menu-item logout">
            <div class="menu-icon-box">
                <svg viewBox="0 0 24 24"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg>
            </div>
            <span class="menu-text">Log Out</span>
            <svg class="menu-chevron" viewBox="0 0 24 24"><polyline points="9 18 15 12 9 6"></polyline></svg>
        </a>
    </div>

    <!-- Edit Profile Modal Overlay -->
    <div id="editProfileModal" class="modal-overlay">
        <div class="modal-content">
            <div class="modal-header">
                <h2>Edit Profile</h2>
                <button type="button" class="btn-close-modal" onclick="closeEditModal()">
                    <svg viewBox="0 0 24 24"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
                </button>
            </div>
            
            <div class="input-group">
                <label>Full Name</label>
                <input type="text" class="input-control" value="Arjun Sharma" />
            </div>
            <div class="input-group">
                <label>Email</label>
                <input type="email" class="input-control" value="arjun.sharma@example.com" />
            </div>
            <div class="input-group">
                <label>Mobile</label>
                <input type="text" class="input-control" value="+91 98765 43210" />
            </div>
            <div class="input-group">
                <label>Bio</label>
                <input type="text" class="input-control" value="Avid reader and book enthusiast." />
            </div>
            
            <div class="modal-footer">
                <button type="button" class="btn-cancel" onclick="closeEditModal()">Cancel</button>
                <button type="button" class="btn-save" onclick="closeEditModal()">Save</button>
            </div>
        </div>
    </div>


    <!-- JavaScript to control Modal -->
    <script>
        function openEditModal() {
            document.getElementById('editProfileModal').style.display = 'flex';
        }
        function closeEditModal() {
            document.getElementById('editProfileModal').style.display = 'none';
        }
    </script>
</asp:Content>