<%@ Page Title="Downloads" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Downloads.aspx.cs" Inherits="BookReadingPlatform.Downloads" %>

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
        .header-title { margin: 0; font-size: 14px; color: #4a5568; font-weight: 600; letter-spacing: 0.5px; text-transform: uppercase; }
        
        .header-right { display: flex; gap: 15px; align-items: center; }
        .download-search { display: flex; align-items: center; background: white; border: 1px solid #e2e8f0; border-radius: 8px; padding: 8px 15px; width: 250px; }
        .download-search svg { width: 14px; height: 14px; stroke: #a0aec0; fill: none; stroke-width: 2; margin-right: 10px; }
        .download-search input { border: none; outline: none; font-size: 13px; width: 100%; color: #4a5568; }
        .header-right .icon-btn { color: #718096; cursor: pointer; display: flex; }
        .header-right .icon-btn svg { width: 18px; height: 18px; stroke: currentColor; fill: none; stroke-width: 2; }

        /* Page Intro & Clear Button */
        .page-intro-row { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 25px; }
        .intro-text h2 { margin: 0 0 5px 0; font-size: 16px; color: #1a202c; }
        .intro-text p { margin: 0; font-size: 13px; color: #4a5568; }
        .btn-clear { background: transparent; border: none; color: #4a5568; font-size: 13px; font-weight: 600; display: flex; align-items: center; gap: 6px; cursor: pointer; padding: 0; }
        .btn-clear svg { width: 14px; height: 14px; stroke: currentColor; fill: none; stroke-width: 2; }

        /* Storage Widget */
        .storage-widget { background: #f8fafc; border: 1px solid #edf2f7; border-radius: 12px; padding: 20px; display: flex; align-items: center; justify-content: space-between; margin-bottom: 30px; }
        .storage-left { display: flex; align-items: center; gap: 15px; }
        .storage-icon { color: #4a5568; }
        .storage-icon svg { width: 20px; height: 20px; stroke: currentColor; fill: none; stroke-width: 2; }
        .storage-info { display: flex; flex-direction: column; }
        .storage-title { font-size: 13px; color: #4a5568; font-weight: 500; margin-bottom: 2px; display: flex; gap: 15px; }
        .storage-title strong { color: #1a202c; font-weight: 700; }
        .storage-detail { font-size: 12px; color: #718096; }
        .storage-detail strong { color: #1a202c; }
        .storage-percent { font-size: 14px; color: #4a5568; font-weight: 600; }

        /* Tabs */
        .history-tabs { display: flex; gap: 25px; border-bottom: 1px solid #e2e8f0; margin-bottom: 25px; }
        .tab { padding: 10px 0; font-size: 13px; font-weight: 500; color: #718096; cursor: pointer; border-bottom: 2px solid transparent; transition: all 0.2s; }
        .tab.active { color: #1a202c; font-weight: 600; border-bottom-color: #1a202c; }

        /* Downloads List */
        .download-list { display: flex; flex-direction: column; gap: 10px; padding-bottom: 40px; }
        
        .dl-card { background: #ffffff; border: 1px solid #edf2f7; border-radius: 12px; padding: 15px 20px; display: flex; align-items: center; transition: box-shadow 0.2s; }
        .dl-card:hover { box-shadow: 0 2px 5px rgba(0,0,0,0.02); }

        .dl-cover { width: 50px; height: 70px; border-radius: 6px; margin-right: 20px; flex-shrink: 0; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding: 5px; box-sizing: border-box; }
        .cover-blue { background-color: #cbd5e1; }
        .cover-green { background-color: #a3b899; }
        .cover-pink { background-color: #fbcfe8; }
        .cover-beige { background-color: #c89d6e; }
        .dl-cover strong { font-size: 7px; font-weight: 700; color: #1a202c; line-height: 1.1; margin-bottom: 2px; }
        .dl-cover .headphone-icon { width: 12px; height: 12px; stroke: #1a202c; fill: none; stroke-width: 2; margin-top: 4px; }

        .dl-info { flex-grow: 1; }
        .dl-meta { display: flex; align-items: center; gap: 10px; margin-bottom: 4px; }
        .dl-genre { font-size: 10px; font-weight: 700; color: #718096; letter-spacing: 0.5px; text-transform: uppercase; }
        .dl-stars { display: flex; align-items: center; gap: 4px; }
        .dl-stars svg { width: 10px; height: 10px; fill: #ecc94b; }
        .dl-rating { font-size: 11px; font-weight: 700; color: #ecc94b; }
        .dl-tag { font-size: 11px; color: #1a202c; font-weight: 600; }
        
        .dl-title { font-size: 14px; font-weight: 700; color: #1a202c; margin: 0 0 2px 0; }
        .dl-author { font-size: 12px; color: #718096; margin: 0 0 8px 0; }
        
        .dl-fileinfo { display: flex; align-items: center; gap: 10px; font-size: 11px; color: #4a5568; }
        .dl-status { display: flex; align-items: center; gap: 4px; color: #38a169; font-weight: 600; }
        .dl-status svg { width: 12px; height: 12px; stroke: currentColor; fill: none; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }
        
        .dl-progress { font-size: 11px; color: #1a202c; font-weight: 600; margin-left: auto; }

        .dl-actions { display: flex; align-items: center; gap: 15px; margin-left: 20px; }
        .icon-btn-small { color: #a0aec0; cursor: pointer; display: flex; }
        .icon-btn-small svg { width: 16px; height: 16px; stroke: currentColor; fill: none; stroke-width: 2; }
        
        .btn-read-offline { background: white; border: 1px solid #e2e8f0; color: #4a5568; padding: 8px 16px; border-radius: 8px; font-weight: 600; font-size: 12px; cursor: pointer; display: flex; align-items: center; gap: 6px; }
        .btn-read-offline svg { width: 14px; height: 14px; stroke: currentColor; fill: none; stroke-width: 2; }
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
            <h2 class="header-title">LOCAL DEVICE STORAGE</h2>
        </div>
        
        <div class="header-right">
            <div class="download-search">
                <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
                <input type="text" placeholder="Search downloads..." />
            </div>
            <div class="icon-btn"><svg viewBox="0 0 24 24"><path d="M18 10h-1.26A8 8 0 1 0 9 20h9a5 5 0 0 0 0-10z"></path></svg></div>
            <div class="icon-btn"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg></div>
        </div>
    </div>

    <!-- Intro Row -->
    <div class="page-intro-row">
        <div class="intro-text">
            <h2>Downloads</h2>
            <p>Manage offline books and audiobooks stored on this device.</p>
        </div>
        <button class="btn-clear">
            <svg viewBox="0 0 24 24"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
            Clear All Downloads
        </button>
    </div>

    <!-- Storage Widget -->
    <div class="storage-widget">
        <div class="storage-left">
            <div class="storage-icon">
                <svg viewBox="0 0 24 24"><rect x="2" y="4" width="20" height="16" rx="2" ry="2"></rect><line x1="6" y1="8" x2="6" y2="8"></line><line x1="6" y1="12" x2="6" y2="12"></line><line x1="6" y1="16" x2="6" y2="16"></line></svg>
            </div>
            <div class="storage-info">
                <div class="storage-title">Device Allocation <strong>8 Titles</strong></div>
                <div class="storage-detail"><strong>420 MB</strong> of 5.0 GB allocated storage used</div>
            </div>
        </div>
        <div class="storage-percent">8.4%</div>
    </div>

    <!-- Tabs -->
    <div class="history-tabs">
        <div class="tab active">All Downloads 8</div>
        <div class="tab">eBooks (6)</div>
        <div class="tab">Audiobooks (2)</div>
        <div class="tab">Completed</div>
    </div>

    <!-- Download List -->
    <div class="download-list">
        
        <!-- Book 1: The Silent Echo -->
        <div class="dl-card">
            <div class="dl-cover cover-blue">
                <strong>The Silent<br/>Echo</strong>
            </div>
            <div class="dl-info">
                <div class="dl-meta">
                    <span class="dl-genre">FANTASY</span>
                    <div class="dl-stars">
                        <svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <span class="dl-rating">4.8</span>
                    </div>
                </div>
                <h3 class="dl-title">The Silent Echo</h3>
                <p class="dl-author">L.J. Aria</p>
                <div class="dl-fileinfo">
                    14.2 MB • ePub
                    <div class="dl-status">
                        <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        Offline ready
                    </div>
                </div>
            </div>
            <div class="dl-actions">
                <div class="icon-btn-small"><svg viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg></div>
                <button class="btn-read-offline">
                    <svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                    Read Offline
                </button>
                <div class="icon-btn-small"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle></svg></div>
            </div>
        </div>

        <!-- Book 2: Ancient Code (PDF) -->
        <div class="dl-card">
            <div class="dl-cover cover-green" style="background:#a0aec0;">
                <strong>Ancient<br/>Code</strong>
            </div>
            <div class="dl-info">
                <div class="dl-meta">
                    <span class="dl-genre">SCI-FI</span>
                    <div class="dl-stars">
                        <svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <span class="dl-rating">4.5</span>
                    </div>
                </div>
                <h3 class="dl-title">Ancient Code</h3>
                <p class="dl-author">Jane Smith</p>
                <div class="dl-fileinfo">
                    18.5 MB • PDF
                    <div class="dl-status">
                        <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        Downloaded
                    </div>
                    <span class="dl-progress">34% read</span>
                </div>
            </div>
            <div class="dl-actions">
                <div class="icon-btn-small" style="color:#1a202c;"><svg style="fill:#1a202c;" viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg></div>
                <button class="btn-read-offline">
                    <svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                    Read Offline
                </button>
                <div class="icon-btn-small"><svg viewBox="0 0 24 24"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg></div>
            </div>
        </div>

        <!-- Book 3: Echoes of Eternity -->
        <div class="dl-card">
            <div class="dl-cover cover-pink">
                <strong>Echoes of<br/>Eternity</strong>
            </div>
            <div class="dl-info">
                <div class="dl-meta">
                    <span class="dl-genre">ROMANCE</span>
                    <div class="dl-stars">
                        <svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <span class="dl-rating">4.6</span>
                    </div>
                    <span class="dl-tag">Completed</span>
                </div>
                <h3 class="dl-title">Echoes of Eternity</h3>
                <p class="dl-author">Elena Richardson</p>
                <div class="dl-fileinfo">
                    12.8 MB • ePub
                    <div class="dl-status">
                        <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"></polyline></svg>
                        Downloaded
                    </div>
                </div>
            </div>
            <div class="dl-actions">
                <div class="icon-btn-small"><svg viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg></div>
                <button class="btn-read-offline">
                    <svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                    Read Offline
                </button>
                <div class="icon-btn-small"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="1"></circle><circle cx="5" cy="12" r="1"></circle><circle cx="19" cy="12" r="1"></circle></svg></div>
            </div>
        </div>


    </div>
</asp:Content>