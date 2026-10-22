<%@ Page Title="Admin Settings" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminSettings.aspx.cs" Inherits="BookReadingPlatform.AdminSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Header */
        .page-header { margin-bottom: 25px; }
        .page-header h1 { margin: 0 0 4px 0; font-size: 24px; color: #0f172a; font-weight: 800; }
        .page-header p { margin: 0; font-size: 13px; color: #94a3b8; }

        /* Settings Card Box */
        .settings-card { background: white; border-radius: 16px; border: 1px solid #edf2f7; box-shadow: 0 1px 3px rgba(0,0,0,0.02); padding: 30px; margin-bottom: 25px; }
        .card-label { font-size: 11px; font-weight: 700; color: #94a3b8; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 25px; display: block; }

        /* Setting Row */
        .setting-row { display: flex; align-items: center; justify-content: space-between; padding-bottom: 20px; border-bottom: 1px solid #f8fafc; margin-bottom: 20px; }
        .setting-info h4 { margin: 0 0 2px 0; font-size: 14px; color: #0f172a; font-weight: 700; }
        .setting-info p { margin: 0; font-size: 12px; color: #94a3b8; }

        /* Toggle Switches */
        .toggle { width: 44px; height: 24px; background: #e2e8f0; border-radius: 12px; position: relative; cursor: pointer; transition: 0.3s; flex-shrink: 0; }
        .toggle.active { background: #3b82f6; }
        .toggle-circle { width: 20px; height: 20px; background: white; border-radius: 50%; position: absolute; top: 2px; left: 2px; transition: 0.3s; box-shadow: 0 1px 2px rgba(0,0,0,0.1); }
        .toggle.active .toggle-circle { left: 22px; }

        /* Input Row */
        .input-row { display: flex; flex-direction: column; gap: 8px; }
        .input-label { font-size: 13px; font-weight: 700; color: #0f172a; }
        .input-action-group { display: flex; gap: 12px; align-items: center; }
        .setting-input { flex-grow: 1; max-width: 400px; padding: 10px 14px; border: 1px solid #e2e8f0; border-radius: 10px; font-size: 13px; color: #0f172a; outline: none; }
        .setting-input:focus { border-color: #3b82f6; }
        .btn-save { background: #3b82f6; color: white; border: none; padding: 10px 24px; border-radius: 10px; font-size: 13px; font-weight: 600; cursor: pointer; box-shadow: 0 2px 5px rgba(59, 130, 246, 0.2); }

        /* Admin Account Box */
        .admin-profile-row { display: flex; align-items: center; gap: 16px; }
        .admin-avatar { width: 45px; height: 45px; background: #3b82f6; color: white; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 16px; font-weight: 700; }
        .admin-details h4 { margin: 0 0 2px 0; font-size: 14px; color: #0f172a; font-weight: 700; }
        .admin-details p { margin: 0; font-size: 12px; color: #94a3b8; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h1>Admin Settings</h1>
        <p>Platform configuration</p>
    </div>

    <!-- Platform Settings Card -->
    <div class="settings-card">
        <span class="card-label">Platform Settings</span>
        
        <!-- Toggle 1 -->
        <div class="setting-row">
            <div class="setting-info">
                <h4>Email Notifications</h4>
                <p>Send alerts to users for new books</p>
            </div>
            <div class="toggle active" onclick="this.classList.toggle('active')">
                <div class="toggle-circle"></div>
            </div>
        </div>

        <!-- Toggle 2 -->
        <div class="setting-row" style="border-bottom: none; margin-bottom: 25px; padding-bottom: 0;">
            <div class="setting-info">
                <h4>Maintenance Mode</h4>
                <p>Disable user access during updates</p>
            </div>
            <div class="toggle" onclick="this.classList.toggle('active')">
                <div class="toggle-circle"></div>
            </div>
        </div>

        <!-- Input Field -->
        <div class="input-row">
            <span class="input-label">Platform Name</span>
            <div class="input-action-group">
                <input type="text" class="setting-input" value="Book Reading" />
                <button type="button" class="btn-save">Save</button>
            </div>
        </div>
    </div>

    <!-- Admin Account Card -->
    <div class="settings-card">
        <span class="card-label">Admin Account</span>
        <div class="admin-profile-row">
            <div class="admin-avatar">A</div>
            <div class="admin-details">
                <h4>Super Admin</h4>
                <p>admin@bookreading.com</p>
            </div>
        </div>
    </div>

</asp:Content>