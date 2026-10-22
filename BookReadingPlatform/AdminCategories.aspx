<%@ Page Title="Categories Management" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminCategories.aspx.cs" Inherits="BookReadingPlatform.AdminCategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Header */
        .page-header { margin-bottom: 35px; }
        .page-header h1 { margin: 0 0 4px 0; font-size: 24px; color: #0f172a; font-weight: 800; }
        .page-header p { margin: 0; font-size: 13px; color: #94a3b8; }

        /* Categories Grid */
        .admin-cat-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; }
        
        /* Category Card */
        .cat-card { background: white; border-radius: 16px; padding: 24px; border: 1px solid #edf2f7; box-shadow: 0 1px 3px rgba(0,0,0,0.02); display: flex; align-items: center; gap: 20px; }
        
        /* Icon Boxes with Custom Backgrounds */
        .cat-icon-box { width: 56px; height: 56px; border-radius: 14px; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
        .cat-icon-box svg { width: 24px; height: 24px; stroke-width: 2; fill: none; stroke: currentColor; stroke-linecap: round; stroke-linejoin: round; }
        
        /* Theme Colors matching screenshot */
        .ib-blue { background: #eff6ff; color: #3b82f6; }
        .ib-purple { background: #faf5ff; color: #a855f7; }
        .ib-green { background: #f0fdf4; color: #10b981; }
        .ib-yellow { background: #fefce8; color: #eab308; }
        .ib-teal { background: #f0fdfa; color: #14b8a6; }

        /* Details */
        .cat-details { flex-grow: 1; display: flex; flex-direction: column; }
        .cat-name { font-size: 16px; font-weight: 700; color: #0f172a; margin-bottom: 2px; }
        .cat-count { font-size: 12px; color: #94a3b8; margin-bottom: 12px; }

        /* Action Buttons Row */
        .cat-actions { display: flex; gap: 8px; }
        .btn-edit { background: #eff6ff; color: #3b82f6; border: none; padding: 6px 16px; border-radius: 6px; font-size: 12px; font-weight: 600; cursor: pointer; }
        .btn-delete { background: #fef2f2; color: #ef4444; border: none; padding: 6px 16px; border-radius: 6px; font-size: 12px; font-weight: 600; cursor: pointer; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h1>Categories</h1>
        <p>Manage book categories</p>
    </div>

    <!-- Grid Layout -->
    <div class="admin-cat-grid">
        
        <!-- Programming -->
        <div class="cat-card">
            <div class="cat-icon-box ib-blue">
                <svg viewBox="0 0 24 24"><polyline points="16 18 22 12 16 6"></polyline><polyline points="8 6 2 12 8 18"></polyline></svg>
            </div>
            <div class="cat-details">
                <span class="cat-name">Programming</span>
                <span class="cat-count">142 books</span>
                <div class="cat-actions">
                    <button class="btn-edit">Edit</button>
                    <button class="btn-delete">Delete</button>
                </div>
            </div>
        </div>

        <!-- Novels -->
        <div class="cat-card">
            <div class="cat-icon-box ib-purple">
                <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line></svg>
            </div>
            <div class="cat-details">
                <span class="cat-name">Novels</span>
                <span class="cat-count">318 books</span>
                <div class="cat-actions">
                    <button class="btn-edit">Edit</button>
                    <button class="btn-delete">Delete</button>
                </div>
            </div>
        </div>

        <!-- Science -->
        <div class="cat-card">
            <div class="cat-icon-box ib-green">
                <svg viewBox="0 0 24 24"><path d="M9 2v6.57l-4.72 8A2 2 0 0 0 6 20h12a2 2 0 0 0 1.72-3.43L15 8.57V2"></path><line x1="6" y1="2" x2="18" y2="2"></line><line x1="6" y1="14" x2="18" y2="14"></line></svg>
            </div>
            <div class="cat-details">
                <span class="cat-name">Science</span>
                <span class="cat-count">205 books</span>
                <div class="cat-actions">
                    <button class="btn-edit">Edit</button>
                    <button class="btn-delete">Delete</button>
                </div>
            </div>
        </div>

        <!-- History -->
        <div class="cat-card">
            <div class="cat-icon-box ib-yellow">
                <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
            </div>
            <div class="cat-details">
                <span class="cat-name">History</span>
                <span class="cat-count">167 books</span>
                <div class="cat-actions">
                    <button class="btn-edit">Edit</button>
                    <button class="btn-delete">Delete</button>
                </div>
            </div>
        </div>

        <!-- Business -->
        <div class="cat-card">
            <div class="cat-icon-box ib-yellow" style="background:#fef9c3;">
                <svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
            </div>
            <div class="cat-details">
                <span class="cat-name">Business</span>
                <span class="cat-count">89 books</span>
                <div class="cat-actions">
                    <button class="btn-edit">Edit</button>
                    <button class="btn-delete">Delete</button>
                </div>
            </div>
        </div>

        <!-- AI -->
        <div class="cat-card">
            <div class="cat-icon-box ib-teal">
                <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"></circle><line x1="12" y1="2" x2="12" y2="5"></line><line x1="12" y1="19" x2="12" y2="22"></line><line x1="2" y1="12" x2="5" y2="12"></line><line x1="19" y1="12" x2="22" y2="12"></line></svg>
            </div>
            <div class="cat-details">
                <span class="cat-name">AI</span>
                <span class="cat-count">56 books</span>
                <div class="cat-actions">
                    <button class="btn-edit">Edit</button>
                    <button class="btn-delete">Delete</button>
                </div>
            </div>
        </div>

    </div>

</asp:Content>