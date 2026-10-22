<%@ Page Title="Search" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="BookReadingPlatform.Search" %>

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

        /* Large Search Bar */
        .large-search-bar {
            display: flex;
            align-items: center;
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 14px 20px;
            margin-bottom: 35px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.01);
        }
        .large-search-bar svg { width: 18px; height: 18px; stroke: #a0aec0; fill: none; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; margin-right: 12px; }
        .large-search-bar input {
            flex-grow: 1;
            border: none;
            outline: none;
            font-size: 14px;
            color: #4a5568;
            background: transparent;
        }
        .large-search-bar input::placeholder { color: #a0aec0; font-weight: 400; }

        /* Section Headers */
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 15px;
        }
        .section-header h3 { margin: 0; font-size: 15px; color: #1a202c; font-weight: 700; }
        .section-header a { color: #5c6ac4; text-decoration: none; font-size: 12px; font-weight: 600; }

        /* Recent Searches Tags */
        .recent-tags { display: flex; gap: 12px; margin-bottom: 35px; flex-wrap: wrap; }
        .tag-pill {
            display: flex;
            align-items: center;
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 20px;
            padding: 6px 14px;
            font-size: 12px;
            color: #4a5568;
            cursor: pointer;
        }
        .tag-pill .icon-clock { width: 12px; height: 12px; stroke: #a0aec0; fill: none; stroke-width: 2; margin-right: 6px; }
        .tag-pill .icon-close { width: 12px; height: 12px; stroke: #a0aec0; fill: none; stroke-width: 2; margin-left: 8px; }

        /* List Layout */
        .books-list { display: flex; flex-direction: column; gap: 16px; padding-bottom: 40px; }

        /* Book Card Horizontal */
        .list-card {
            background: #ffffff;
            border-radius: 16px;
            padding: 16px;
            display: flex;
            align-items: center;
            border: 1px solid #edf2f7;
            box-shadow: 0 1px 3px rgba(0,0,0,0.02);
        }

        /* Book Cover */
        .list-cover {
            width: 55px;
            height: 75px;
            border-radius: 8px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 6px;
            box-sizing: border-box;
            margin-right: 20px;
            text-align: center;
            flex-shrink: 0;
        }
        .cover-blue { background-color: #cbd5e1; }
        .cover-green { background-color: #bbf7d0; }
        .cover-pink { background-color: #fbcfe8; }
        .cover-beige { background-color: #e2d3c1; }

        .list-cover strong { font-size: 8px; font-weight: 700; color: #1a202c; margin-bottom: 2px; line-height: 1.1; }
        .list-cover span { font-size: 6px; color: #4a5568; }

        /* Book Info */
        .list-info { flex-grow: 1; display: flex; flex-direction: column; justify-content: center; }
        .list-title { font-size: 14px; font-weight: 700; color: #1a202c; margin: 0 0 4px 0; }
        .list-author { font-size: 12px; color: #a0aec0; margin: 0 0 10px 0; }
        
        /* Tags & Stars Row */
        .tags-stars-row { display: flex; align-items: center; gap: 15px; }
        .genre-tags { display: flex; gap: 8px; }
        .genre-badge { padding: 4px 10px; border-radius: 12px; font-size: 10px; font-weight: 600; }
        
        /* Custom Colors for Genres */
        .genre-fantasy { color: #805ad5; background-color: #faf5ff; }
        .genre-mystery { color: #e53e3e; background-color: #fff5f5; }
        .genre-science { color: #38a169; background-color: #f0fff4; }
        .genre-thriller { color: #dd6b20; background-color: #fffaf0; }
        .genre-fiction { color: #3182ce; background-color: #ebf8ff; }
        .genre-romance { color: #d53f8c; background-color: #fff5f7; }
        .genre-travel { color: #dd6b20; background-color: #fffaf0; }
        .genre-adventure { color: #319795; background-color: #e6fffa; }

        .stars { display: flex; gap: 2px; }
        .star-svg { width: 10px; height: 10px; fill: #ecc94b; }
        .star-svg-empty { width: 10px; height: 10px; fill: #e2e8f0; }

        /* Heart Button right aligned */
        .btn-action {
            margin-left: auto;
            padding: 10px;
            cursor: pointer;
            display: flex;
            align-items: center;
        }
        .heart-icon-filled { width: 18px; height: 18px; fill: #e53e3e; }
        .heart-icon-outline { width: 18px; height: 18px; stroke: #a0aec0; stroke-width: 2; fill: none; stroke-linecap: round; stroke-linejoin: round; }
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
            <h2>Search</h2>
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

    <!-- Large Search Input -->
    <div class="large-search-bar">
        <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
        <input type="text" placeholder="Search titles, authors, or genres..." />
    </div>

    <!-- Recent Searches Section -->
    <div class="section-header">
        <h3>Recent Searches</h3>
        <a href="#">Clear All</a>
    </div>
    <div class="recent-tags">
        <div class="tag-pill">
            <svg class="icon-clock" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
            Classic Literature
            <svg class="icon-close" viewBox="0 0 24 24"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
        </div>
        <div class="tag-pill">
            <svg class="icon-clock" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
            Philosophy of Mind
            <svg class="icon-close" viewBox="0 0 24 24"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
        </div>
        <div class="tag-pill">
            <svg class="icon-clock" viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg>
            Jane Austen
            <svg class="icon-close" viewBox="0 0 24 24"><line x1="18" y1="6" x2="6" y2="18"></line><line x1="6" y1="6" x2="18" y2="18"></line></svg>
        </div>
    </div>

    <!-- All Books Section -->
    <div class="section-header" style="margin-bottom: 20px;">
        <h3>All Books</h3>
    </div>
    
    <div class="books-list">
        
        <!-- Book 1 -->
        <div class="list-card">
            <div class="list-cover cover-blue">
                <strong>The Silent<br/>Echo</strong>
                <span>L.J. Aria</span>
            </div>
            <div class="list-info">
                <h4 class="list-title">The Silent Echo</h4>
                <p class="list-author">L.J. Aria</p>
                <div class="tags-stars-row">
                    <div class="genre-tags">
                        <span class="genre-badge genre-fantasy">Fantasy</span>
                        <span class="genre-badge genre-mystery">Mystery</span>
                    </div>
                    <div class="stars">
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    </div>
                </div>
            </div>
            <div class="btn-action">
                <svg class="heart-icon-filled" viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
            </div>
        </div>

        <!-- Book 2 -->
        <div class="list-card">
            <div class="list-cover cover-green">
                <strong>Ancient<br/>Code</strong>
                <span>Jane Smith</span>
            </div>
            <div class="list-info">
                <h4 class="list-title">Ancient Code</h4>
                <p class="list-author">Jane Smith</p>
                <div class="tags-stars-row">
                    <div class="genre-tags">
                        <span class="genre-badge genre-science">Science</span>
                        <span class="genre-badge genre-thriller">Thriller</span>
                    </div>
                    <div class="stars">
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    </div>
                </div>
            </div>
            <div class="btn-action">
                <svg class="heart-icon-outline" viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
            </div>
        </div>

        <!-- Book 3 -->
        <div class="list-card">
            <div class="list-cover cover-pink">
                <strong>Echoes of<br/>Eternity</strong>
                <span>Elena Richardson</span>
            </div>
            <div class="list-info">
                <h4 class="list-title">Echoes of Eternity</h4>
                <p class="list-author">Elena Richardson</p>
                <div class="tags-stars-row">
                    <div class="genre-tags">
                        <span class="genre-badge genre-fiction">Fiction</span>
                        <span class="genre-badge genre-romance">Romance</span>
                    </div>
                    <div class="stars">
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    </div>
                </div>
            </div>
            <div class="btn-action">
                <svg class="heart-icon-filled" viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
            </div>
        </div>

        <!-- Book 4 -->
        <div class="list-card">
            <div class="list-cover cover-beige">
                <strong>Whimsical<br/>Wanderlust</strong>
                <span>Leo Brooks</span>
            </div>
            <div class="list-info">
                <h4 class="list-title">Whimsical Wanderlust</h4>
                <p class="list-author">Leo Brooks</p>
                <div class="tags-stars-row">
                    <div class="genre-tags">
                        <span class="genre-badge genre-travel">Travel</span>
                        <span class="genre-badge genre-adventure">Adventure</span>
                    </div>
                    <div class="stars">
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                        <svg class="star-svg-empty" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    </div>
                </div>
            </div>
            <div class="btn-action">
                <svg class="heart-icon-outline" viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
            </div>
        </div>

    </div>

    <!-- Script to set the sidebar active state dynamically -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const links = document.querySelectorAll('.nav-link');
            links.forEach(link => {
                link.classList.remove('active');
                if (link.innerText.trim() === 'Search') {
                    link.classList.add('active');
                }
            });
        });
    </script>
</asp:Content>