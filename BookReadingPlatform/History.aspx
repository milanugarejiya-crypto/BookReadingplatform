<%@ Page Title="Reading History" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="History.aspx.cs" Inherits="BookReadingPlatform.History" %>

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
        .header-title { margin: 0; font-size: 18px; color: #1a202c; font-weight: 700; letter-spacing: -0.2px; }
        
        .header-right { display: flex; gap: 10px; }
        .circle-btn { width: 36px; height: 36px; border-radius: 50%; background: #f8fafc; border: 1px solid #e2e8f0; display: flex; align-items: center; justify-content: center; color: #718096; cursor: pointer; }
        .circle-btn svg { width: 16px; height: 16px; fill: none; stroke: currentColor; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }

        /* Top Stats Row */
        .stats-row { display: flex; align-items: center; justify-content: space-between; margin-bottom: 25px; }
        .stat-blocks { display: flex; gap: 30px; }
        .stat-item { display: flex; align-items: center; gap: 12px; }
        .stat-icon { color: #4a5568; display: flex; align-items: center; }
        .stat-icon svg { width: 18px; height: 18px; stroke: currentColor; fill: none; stroke-width: 2; }
        .stat-data { display: flex; flex-direction: column; }
        .stat-label { font-size: 10px; color: #718096; font-weight: 700; letter-spacing: 0.5px; text-transform: uppercase; margin-bottom: 2px; }
        .stat-value { font-size: 15px; color: #1a202c; font-weight: 700; }

        /* Tabs */
        .history-tabs { display: flex; gap: 20px; border-bottom: 1px solid #e2e8f0; margin-bottom: 30px; }
        .tab { padding: 10px 0; font-size: 14px; font-weight: 500; color: #718096; cursor: pointer; border-bottom: 2px solid transparent; transition: all 0.2s; }
        .tab.active { color: #1a202c; font-weight: 600; border-bottom-color: #1a202c; }
        
        /* Date Headers */
        .date-header { display: flex; justify-content: space-between; align-items: flex-end; margin-bottom: 15px; margin-top: 30px; }
        .date-header:first-of-type { margin-top: 0; }
        .date-title { font-size: 12px; font-weight: 700; color: #4a5568; letter-spacing: 0.5px; text-transform: uppercase; }
        .date-summary { font-size: 12px; color: #718096; }

        /* History Cards */
        .history-card { background: #ffffff; border: 1px solid #edf2f7; border-radius: 16px; padding: 20px; display: flex; align-items: center; margin-bottom: 15px; box-shadow: 0 1px 2px rgba(0,0,0,0.02); }
        
        .card-cover { width: 65px; height: 90px; border-radius: 8px; margin-right: 20px; flex-shrink: 0; display: flex; flex-direction: column; justify-content: center; align-items: center; text-align: center; padding: 5px; box-sizing: border-box; }
        .cover-blue { background-color: #cbd5e1; }
        .cover-green { background-color: #bbf7d0; }
        .cover-pink { background-color: #fbcfe8; }
        .cover-beige { background-color: #e2d3c1; }
        .card-cover strong { font-size: 9px; font-weight: 700; color: #1a202c; line-height: 1.1; margin-bottom: 4px; }
        
        /* Main Info Section */
        .card-info { flex-grow: 1; }
        .genre-rating { display: flex; align-items: center; gap: 8px; margin-bottom: 6px; }
        .genre-text { font-size: 12px; font-weight: 600; color: #4a5568; }
        .stars { display: flex; align-items: center; gap: 4px; }
        .stars svg { width: 12px; height: 12px; fill: #ecc94b; }
        .rating-num { font-size: 12px; font-weight: 700; color: #ecc94b; }
        
        .book-title { font-size: 16px; font-weight: 700; color: #1a202c; margin: 0 0 4px 0; }
        .book-author { font-size: 13px; color: #718096; margin: 0 0 10px 0; }
        .session-info { display: flex; align-items: center; gap: 6px; font-size: 12px; color: #4a5568; }
        .session-info svg { width: 12px; height: 12px; stroke: #a0aec0; fill: none; stroke-width: 2; }
        .session-info.completed { color: #38a169; }
        .session-info.completed svg { stroke: #38a169; }

        /* Right Side Actions */
        .card-actions { display: flex; align-items: center; gap: 20px; }
        
        /* Progress & Status Blocks */
        .progress-block { display: flex; align-items: center; gap: 10px; text-align: right; }
        .progress-text { font-size: 12px; color: #718096; display: flex; flex-direction: column; }
        .progress-text strong { font-size: 14px; color: #1a202c; font-weight: 700; }
        
        .status-block { display: flex; align-items: center; gap: 8px; }
        .status-label { font-size: 12px; color: #718096; }
        .status-badge { background: #f0fff4; color: #38a169; padding: 4px 10px; border-radius: 12px; font-size: 12px; font-weight: 700; }

        .btn-action { background: #f8fafc; border: 1px solid #e2e8f0; color: #4a5568; padding: 8px 16px; border-radius: 8px; font-weight: 600; font-size: 13px; cursor: pointer; display: flex; align-items: center; gap: 6px; }
        .btn-action svg { width: 14px; height: 14px; stroke: currentColor; fill: none; stroke-width: 2; }
        
        .icon-btn { color: #a0aec0; cursor: pointer; display: flex; }
        .icon-btn svg { width: 18px; height: 18px; stroke: currentColor; fill: none; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }

        /* Footer */
        .footer-action { text-align: center; margin-top: 40px; padding-bottom: 20px; }
        .btn-load { background: white; border: 1px solid #e2e8f0; color: #4a5568; padding: 10px 24px; border-radius: 20px; font-size: 13px; font-weight: 600; cursor: pointer; display: inline-flex; align-items: center; gap: 8px; margin-bottom: 15px; }
        .btn-load svg { width: 14px; height: 14px; stroke: currentColor; fill: none; stroke-width: 2; }
        .footer-note { font-size: 12px; color: #a0aec0; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- Header with Stats -->
    <div class="header-top">
        <div class="header-left">
            <div class="header-dots">
                <div class="dot dot-red"></div>
                <div class="dot dot-yellow"></div>
                <div class="dot dot-green"></div>
            </div>
            <h2 class="header-title">Reading History</h2>
        </div>
        
        <div class="stat-blocks">
            <div class="stat-item">
                <div class="stat-icon"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg></div>
                <div class="stat-data">
                    <span class="stat-label">Time</span>
                    <span class="stat-value">38.5 hrs</span>
                </div>
            </div>
            <div class="stat-item">
                <div class="stat-icon"><svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg></div>
                <div class="stat-data">
                    <span class="stat-label">Finished</span>
                    <span class="stat-value">12 books</span>
                </div>
            </div>
            <div class="stat-item">
                <div class="stat-icon"><svg viewBox="0 0 24 24"><path d="M13 2L3 14h9l-1 8 10-12h-9l1-8z"></path></svg></div>
                <div class="stat-data">
                    <span class="stat-label">Streak</span>
                    <span class="stat-value">7 Days</span>
                </div>
            </div>
        </div>

        <div class="header-right">
            <div class="circle-btn"><svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg></div>
            <div class="circle-btn"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg></div>
        </div>
    </div>

    <!-- Tabs -->
    <div class="history-tabs">
        <div class="tab active">All History (14)</div>
        <div class="tab">This Week</div>
        <div class="tab">This Month</div>
        <div class="tab">Finished</div>
        <div class="tab">In Progress</div>
    </div>

    <!-- TODAY -->
    <div class="date-header">
        <div class="date-title">Today</div>
        <div class="date-summary">1 session • 35 mins</div>
    </div>

    <div class="history-card">
        <div class="card-cover cover-blue">
            <strong>The Silent<br/>Echo</strong>
        </div>
        <div class="card-info">
            <div class="genre-rating">
                <span class="genre-text">Fantasy</span>
                <div class="stars">
                    <svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <span class="rating-num">4.8</span>
                </div>
            </div>
            <h3 class="book-title">The Silent Echo</h3>
            <p class="book-author">by L.J. Aria</p>
            <div class="session-info">
                <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                Read 42 pages • 35 mins (2 hours ago)
            </div>
        </div>
        <div class="card-actions">
            <div class="progress-block">
                <div class="progress-text">Progress <strong>68%<br/>Done</strong></div>
            </div>
            <button class="btn-action">
                <svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                Resume Reading
            </button>
            <div class="icon-btn"><svg viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg></div>
            <div class="icon-btn"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg></div>
        </div>
    </div>

    <!-- YESTERDAY -->
    <div class="date-header">
        <div class="date-title">Yesterday</div>
        <div class="date-summary">1 session • 50 mins</div>
    </div>

    <div class="history-card">
        <div class="card-cover cover-green">
            <strong>Ancient<br/>Code</strong>
        </div>
        <div class="card-info">
            <div class="genre-rating">
                <span class="genre-text">Sci-Fi</span>
                <div class="stars">
                    <svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <span class="rating-num">4.6</span>
                </div>
            </div>
            <h3 class="book-title">Ancient Code</h3>
            <p class="book-author">by Jane Smith</p>
            <div class="session-info">
                <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
                Read 28 pages • 50 mins (Yesterday at 9:15 PM)
            </div>
        </div>
        <div class="card-actions">
            <div class="progress-block">
                <div class="progress-text">Progress <strong>34%<br/>Done</strong></div>
            </div>
            <button class="btn-action">
                <svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                Resume Reading
            </button>
            <div class="icon-btn"><svg viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg></div>
            <div class="icon-btn"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg></div>
        </div>
    </div>

    <!-- LAST WEEK -->
    <div class="date-header">
        <div class="date-title">Last Week</div>
        <div class="date-summary">3 sessions • 4 hrs 10 mins</div>
    </div>

    <div class="history-card">
        <div class="card-cover cover-pink">
            <strong>Echoes of<br/>Eternity</strong>
        </div>
        <div class="card-info">
            <div class="genre-rating">
                <span class="genre-text">Romance</span>
                <div class="stars">
                    <svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <span class="rating-num">4.9</span>
                </div>
            </div>
            <h3 class="book-title">Echoes of Eternity</h3>
            <p class="book-author">by Elena Richardson</p>
            <div class="session-info completed">
                <svg viewBox="0 0 24 24"><polyline points="20 6 9 17 4 12"></polyline></svg>
                Finished reading on Oct 20, 2024
            </div>
        </div>
        <div class="card-actions">
            <div class="status-block">
                <span class="status-label">Status</span>
                <span class="status-badge">Completed</span>
            </div>
            <button class="btn-action">
                <svg viewBox="0 0 24 24"><polyline points="1 4 1 10 7 10"></polyline><polyline points="23 20 23 14 17 14"></polyline><path d="M20.49 9A9 9 0 0 0 5.64 5.64L1 10m22 4l-4.64 4.36A9 9 0 0 1 3.51 15"></path></svg>
                Re-read
            </button>
            <div class="icon-btn" style="color:#e53e3e;"><svg style="fill:#e53e3e; stroke:none;" viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg></div>
            <div class="icon-btn"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg></div>
        </div>
    </div>

    <!-- Footer Action -->
    <div class="footer-action">
        <button class="btn-load">
            <svg viewBox="0 0 24 24"><polyline points="1 4 1 10 7 10"></polyline><path d="M3.51 15a9 9 0 1 0 2.13-9.36L1 10"></path></svg>
            Load Older History
        </button>
        <div class="footer-note">Showing reading sessions recorded over the past 30 days</div>
    </div>
</asp:Content>