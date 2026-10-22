<%@ Page Title="Book Management" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminBooks.aspx.cs" Inherits="BookReadingPlatform.AdminBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Header */
        .page-header { margin-bottom: 25px; }
        .page-header h1 { margin: 0 0 4px 0; font-size: 24px; color: #0f172a; font-weight: 800; }
        .page-header p { margin: 0; font-size: 13px; color: #94a3b8; }

        /* Toolbar Row */
        .toolbar-row { display: flex; justify-content: space-between; align-items: center; margin-bottom: 30px; }
        .search-box { display: flex; align-items: center; background: white; border: 1px solid #e2e8f0; border-radius: 10px; padding: 8px 15px; width: 320px; box-shadow: 0 1px 2px rgba(0,0,0,0.01); }
        .search-box svg { width: 16px; height: 16px; stroke: #94a3b8; fill: none; stroke-width: 2; margin-right: 10px; }
        .search-box input { border: none; outline: none; font-size: 13px; width: 100%; color: #0f172a; background: transparent; }
        
        .btn-addbook { background: #3b82f6; color: white; border: none; padding: 10px 20px; border-radius: 10px; font-size: 13px; font-weight: 600; cursor: pointer; display: flex; align-items: center; gap: 8px; box-shadow: 0 2px 5px rgba(59, 130, 246, 0.2); }
        .btn-addbook svg { width: 16px; height: 16px; stroke: currentColor; fill: none; stroke-width: 2; }

        /* Book Management Grid */
        .admin-book-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 25px; padding-bottom: 40px; }
        
        .admin-book-card { background: white; border-radius: 16px; padding: 16px; border: 1px solid #edf2f7; box-shadow: 0 1px 3px rgba(0,0,0,0.02); display: flex; flex-direction: column; }
        
        /* Pastel Cover */
        .ab-cover { height: 150px; border-radius: 12px; padding: 15px; display: flex; flex-direction: column; justify-content: space-between; margin-bottom: 15px; }
        .c-blue { background-color: #cbd5e1; }
        .c-green { background-color: #bbf7d0; }
        .c-pink { background-color: #fbcfe8; }
        .c-lightgreen { background-color: #d1e7dd; }
        .c-beige { background-color: #e2d3c1; }
        
        .ab-quote { width: 14px; height: 14px; stroke: #4a5568; fill: none; stroke-width: 2; }
        .ab-cover-text strong { display: block; font-size: 12px; font-weight: 700; color: #1a202c; margin-bottom: 2px; }
        .ab-cover-text span { font-size: 10px; color: #4a5568; }

        /* Card Content */
        .ab-title { font-size: 14px; font-weight: 700; color: #0f172a; margin: 0 0 2px 0; }
        .ab-author { font-size: 12px; color: #94a3b8; margin: 0 0 10px 0; }

        .ab-meta { display: flex; align-items: center; gap: 6px; margin-bottom: 15px; }
        .stars { display: flex; gap: 2px; }
        .stars svg { width: 10px; height: 10px; fill: #eab308; }
        .rating-num { font-size: 11px; font-weight: 700; color: #0f172a; }
        .badge-genre { background: #f8fafc; border: 1px solid #e2e8f0; color: #4a5568; padding: 2px 8px; border-radius: 10px; font-size: 10px; font-weight: 600; }
        .page-count { font-size: 11px; color: #94a3b8; margin-left: auto; }

        /* Action Buttons Row */
        .ab-actions { display: flex; gap: 10px; margin-top: auto; }
        .btn-edit { background: #eff6ff; color: #3b82f6; border: none; padding: 8px; border-radius: 8px; font-size: 12px; font-weight: 600; cursor: pointer; flex-grow: 1; text-align: center; }
        .btn-delete { background: #fef2f2; color: #ef4444; border: none; padding: 8px; border-radius: 8px; font-size: 12px; font-weight: 600; cursor: pointer; flex-grow: 1; text-align: center; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h1>Book Management</h1>
        <p>8 books</p>
    </div>

    <!-- Toolbar -->
    <div class="toolbar-row">
        <div class="search-box">
            <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
            <input type="text" placeholder="Search books..." />
        </div>
        <button type="button" class="btn-addbook">
            <svg viewBox="0 0 24 24"><line x1="12" y1="5" x2="12" y2="19"></line><line x1="5" y1="12" x2="19" y2="12"></line></svg>
            Add Book
        </button>
    </div>

    <!-- Grid Layout -->
    <div class="admin-book-grid">
        
        <!-- Book 1 -->
        <div class="admin-book-card">
            <div class="ab-cover c-blue">
                <svg class="ab-quote" viewBox="0 0 24 24"><path d="M6 17h3l2-4V7H5v6h3zm8 0h3l2-4V7h-6v6h3z"></path></svg>
                <div class="ab-cover-text"><strong>The Silent Echo</strong><span>L.J. Aria</span></div>
            </div>
            <h3 class="ab-title">The Silent Echo</h3>
            <p class="ab-author">L.J. Aria</p>
            <div class="ab-meta">
                <div class="stars"><svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg></div>
                <span class="rating-num">4.8</span>
                <span class="badge-genre">Fantasy</span>
                <span class="page-count">284p</span>
            </div>
            <div class="ab-actions">
                <button class="btn-edit">Edit</button>
                <button class="btn-delete">Delete</button>
            </div>
        </div>

        <!-- Book 2 -->
        <div class="admin-book-card">
            <div class="ab-cover c-green">
                <svg class="ab-quote" viewBox="0 0 24 24"><path d="M6 17h3l2-4V7H5v6h3zm8 0h3l2-4V7h-6v6h3z"></path></svg>
                <div class="ab-cover-text"><strong>Ancient Code</strong><span>Jane Smith</span></div>
            </div>
            <h3 class="ab-title">Ancient Code</h3>
            <p class="ab-author">Jane Smith</p>
            <div class="ab-meta">
                <div class="stars"><svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg></div>
                <span class="rating-num">4.5</span>
                <span class="badge-genre">Science</span>
                <span class="page-count">312p</span>
            </div>
            <div class="ab-actions">
                <button class="btn-edit">Edit</button>
                <button class="btn-delete">Delete</button>
            </div>
        </div>

        <!-- Book 3 -->
        <div class="admin-book-card">
            <div class="ab-cover c-pink">
                <svg class="ab-quote" viewBox="0 0 24 24"><path d="M6 17h3l2-4V7H5v6h3zm8 0h3l2-4V7h-6v6h3z"></path></svg>
                <div class="ab-cover-text"><strong>Echoes of Eternity</strong><span>Elena Richardson</span></div>
            </div>
            <h3 class="ab-title">Echoes of Eternity</h3>
            <p class="ab-author">Elena Richardson</p>
            <div class="ab-meta">
                <div class="stars"><svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg></div>
                <span class="rating-num">4.6</span>
                <span class="badge-genre">Fiction</span>
                <span class="page-count">256p</span>
            </div>
            <div class="ab-actions">
                <button class="btn-edit">Edit</button>
                <button class="btn-delete">Delete</button>
            </div>
        </div>

        <!-- Book 4 -->
        <div class="admin-book-card">
            <div class="ab-cover c-blue">
                <svg class="ab-quote" viewBox="0 0 24 24"><path d="M6 17h3l2-4V7H5v6h3zm8 0h3l2-4V7h-6v6h3z"></path></svg>
                <div class="ab-cover-text"><strong>The Silent Algorithm</strong><span>Marcus Vance</span></div>
            </div>
            <h3 class="ab-title">The Silent Algorithm</h3>
            <p class="ab-author">Marcus Vance</p>
            <div class="ab-meta">
                <div class="stars"><svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg></div>
                <span class="rating-num">4.5</span>
                <span class="badge-genre">Tech</span>
                <span class="page-count">398p</span>
            </div>
            <div class="ab-actions">
                <button class="btn-edit">Edit</button>
                <button class="btn-delete">Delete</button>
            </div>
        </div>

        <!-- Row 2 (Placeholder Cards matching your screenshot) -->
        <div class="admin-book-card"><div class="ab-cover c-lightgreen"></div></div>
        <div class="admin-book-card"><div class="ab-cover c-beige"></div></div>
        <div class="admin-book-card"><div class="ab-cover" style="background:#d3c6bc;"></div></div>
        <div class="admin-book-card"><div class="ab-cover" style="background:#e5c185;"></div></div>

    </div>

</asp:Content>