<%@ Page Title="Home" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BookReadingPlatform.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .header-top { display: flex; align-items: center; justify-content: space-between; margin-bottom: 25px; }
        .header-left { display: flex; align-items: center; }
        .header-dots { display: flex; gap: 6px; margin-right: 15px; }
        .dot { width: 8px; height: 8px; border-radius: 50%; }
        .dot-red { background-color: #fc8181; }
        .dot-yellow { background-color: #f6e05e; }
        .dot-green { background-color: #68d391; }
        .header-top h2 { margin: 0; font-size: 20px; color: #1a202c; font-weight: 700; letter-spacing: -0.5px; }
        
        .header-right { display: flex; gap: 10px; }
        .circle-btn { width: 32px; height: 32px; border-radius: 50%; border: 1px solid #e2e8f0; display: flex; align-items: center; justify-content: center; color: #718096; background: white; cursor: pointer; }
        
        /* Hero Banner */
        .hero-banner {
            background-color: #5c6ac4; 
            color: white;
            padding: 40px;
            border-radius: 16px;
            margin-bottom: 30px;
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .hero-banner p.welcome-text { margin: 0 0 5px 0; font-size: 13px; opacity: 0.8; font-weight: 500; }
        .hero-banner h1 { margin: 0 0 15px 0; font-size: 32px; font-weight: 700; }
        .hero-banner p.sub-text { margin: 0; font-size: 14px; opacity: 0.9; }
        
        .hero-graphic {
            position: absolute;
            right: 40px;
            top: 20px;
            width: 140px;
            height: 140px;
            background: rgba(255,255,255,0.15);
            border-radius: 16px;
        }
        .hero-graphic::after {
            content: '';
            position: absolute;
            right: -25px;
            top: 15px;
            width: 140px;
            height: 140px;
            background: rgba(255,255,255,0.1);
            border-radius: 16px;
        }

        /* Search Bar */
        .search-container {
            display: flex;
            background: white;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 6px 6px 6px 15px;
            margin-bottom: 35px;
            align-items: center;
        }
        .search-icon { color: #a0aec0; width: 18px; height: 18px; margin-right: 10px; display: flex; }
        .search-input {
            flex-grow: 1;
            border: none;
            outline: none;
            font-size: 14px;
            background: transparent;
            color: #4a5568;
        }
        .search-input::placeholder { color: #a0aec0; }
        .btn-search {
            background-color: #2b6cb0;
            color: white;
            border: none;
            padding: 10px 24px;
            border-radius: 8px;
            font-weight: 600;
            cursor: pointer;
            font-size: 13px;
        }

        /* Section Headers */
        .section-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }
        .section-header h3 { margin: 0; font-size: 17px; color: #1a202c; font-weight: 700; }
        .section-header a { color: #5c6ac4; text-decoration: none; font-size: 13px; font-weight: 600; }

        /* Recently Added Grid */
        .recent-grid { display: flex; gap: 20px; margin-bottom: 40px; }
        .recent-card { width: 190px; }
        
        .recent-cover {
            height: 125px;
            border-radius: 12px;
            margin-bottom: 12px;
            position: relative;
            padding: 15px;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            box-sizing: border-box;
        }
        
        .cover-blue { background-color: #cbd5e1; }
        .cover-green { background-color: #bbf7d0; }
        .cover-pink { background-color: #fbcfe8; }
        
        .book-icon-small { position: absolute; top: 15px; left: 15px; color: rgba(0,0,0,0.4); width: 16px; height: 16px; }
        
        .heart-circle {
            position: absolute;
            top: 12px;
            right: 12px;
            background: white;
            border-radius: 50%;
            width: 26px;
            height: 26px;
            display: flex;
            justify-content: center;
            align-items: center;
            box-shadow: 0 2px 4px rgba(0,0,0,0.05);
        }
        .heart-icon-filled { width: 14px; height: 14px; fill: #e53e3e; }
        .heart-icon-outline { width: 14px; height: 14px; stroke: #a0aec0; stroke-width: 2; fill: none; }

        .recent-cover strong { font-size: 12px; color: #1a202c; margin-bottom: 2px; }
        .recent-cover span { font-size: 10px; color: #4a5568; }

        .recent-text strong { display: block; font-size: 13px; color: #1a202c; margin-bottom: 2px; font-weight: 700; }
        .recent-text span { font-size: 11px; color: #718096; }

        /* Trending List */
        .trending-list { display: flex; flex-direction: column; gap: 12px; padding-bottom: 40px; }
        .trending-card {
            display: flex;
            background: white;
            border: 1px solid #edf2f7;
            border-radius: 12px;
            padding: 16px;
            align-items: center;
            box-shadow: 0 1px 2px rgba(0,0,0,0.02);
        }
        
        .trending-cover {
            width: 65px;
            height: 85px;
            border-radius: 6px;
            margin-right: 20px;
            flex-shrink: 0;
            display: flex;
            flex-direction: column;
            justify-content: flex-end;
            padding: 8px;
            box-sizing: border-box;
        }
        .trending-cover strong { font-size: 9px; color: rgba(0,0,0,0.7); line-height: 1.2; margin-bottom: 2px; }
        .trending-cover span { font-size: 7px; color: rgba(0,0,0,0.5); }

        .trending-info { flex-grow: 1; }
        .trending-info strong.title { display: block; font-size: 14px; color: #1a202c; margin-bottom: 4px; font-weight: 700; }
        .trending-info span.author { font-size: 12px; color: #718096; display: block; margin-bottom: 6px; }
        
        .rating-row { display: flex; align-items: center; gap: 4px; margin-bottom: 6px; }
        .star-svg { width: 12px; height: 12px; fill: #ecc94b; }
        .star-svg-empty { width: 12px; height: 12px; fill: #e2e8f0; }
        .rating-text { font-size: 12px; color: #1a202c; font-weight: 700; margin-left: 4px; }
        
        .synopsis { margin: 0; font-size: 12px; color: #a0aec0; display: -webkit-box; -webkit-line-clamp: 1; -webkit-box-orient: vertical; overflow: hidden; }
        
        .trending-action { cursor: pointer; padding: 0 10px; display: flex; align-items: center; }
        .trending-action svg { width: 18px; height: 18px; stroke: #a0aec0; stroke-width: 2; fill: none; }
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
            <h2>Home</h2>
        </div>
        <div class="header-right">
            <div class="circle-btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
            </div>
            <div class="circle-btn">
                <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg>
            </div>
        </div>
    </div>

    <!-- Hero Banner -->
    <div class="hero-banner">
        <div class="hero-graphic"></div>
        <p class="welcome-text">Welcome back,</p>
        <h1>Hello, Arjun!</h1>
        <p class="sub-text">Ready to dive into a new story today?</p>
    </div>

    <!-- Search Bar -->
    <div class="search-container">
        <div class="search-icon">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
        </div>
        <input type="text" class="search-input" placeholder="Search for books, authors..." />
        <button type="button" class="btn-search">Search</button>
    </div>

    <!-- Recently Added Section -->
    <div class="section-header">
        <h3>Recently Added Books</h3>
        <a href="#">See all</a>
    </div>
    
    <div class="recent-grid">
        <!-- Card 1 -->
        <div class="recent-card">
            <div class="recent-cover cover-blue">
                <div class="book-icon-small">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                </div>
                <div class="heart-circle">
                    <svg class="heart-icon-filled" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
                </div>
                <strong>The Silent Echo</strong>
                <span>L.J. Aria</span>
            </div>
            <div class="recent-text">
                <strong>The Silent Echo</strong>
                <span>L.J. Aria</span>
            </div>
        </div>
        
        <!-- Card 2 -->
        <div class="recent-card">
            <div class="recent-cover cover-green">
                <div class="book-icon-small">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                </div>
                <div class="heart-circle">
                    <svg class="heart-icon-outline" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
                </div>
                <strong>Ancient Code</strong>
                <span>Jane Smith</span>
            </div>
            <div class="recent-text">
                <strong>Ancient Code</strong>
                <span>Jane Smith</span>
            </div>
        </div>

        <!-- Card 3 -->
        <div class="recent-card">
            <div class="recent-cover cover-pink">
                <div class="book-icon-small">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                </div>
                <div class="heart-circle">
                    <svg class="heart-icon-filled" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
                </div>
                <strong>Echoes of Eternity</strong>
                <span>Elena Richardson</span>
            </div>
            <div class="recent-text">
                <strong>Echoes of Eternity</strong>
                <span>Elena Richardson</span>
            </div>
        </div>

        <!-- Card 4 -->
        <div class="recent-card">
            <div class="recent-cover cover-blue">
                <div class="book-icon-small">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                </div>
                <div class="heart-circle">
                    <svg class="heart-icon-outline" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
                </div>
                <strong>The Silent Algorithm</strong>
                <span>Marcus Vance</span>
            </div>
            <div class="recent-text">
                <strong>The Silent Algorithm</strong>
                <span>Marcus Vance</span>
            </div>
        </div>
    </div>

    <!-- Trending Now Section -->
    <div class="section-header">
        <h3>Trending Now</h3>
        <a href="#">See all</a>
    </div>
    
    <div class="trending-list">
        <!-- Trending 1 -->
        <div class="trending-card">
            <div class="trending-cover" style="background-color: #a3b899;">
                <strong>Focus Redefined</strong>
                <span>Rahul Mehta</span>
            </div>
            <div class="trending-info">
                <strong class="title">Focus Redefined</strong>
                <span class="author">Rahul Mehta</span>
                <div class="rating-row">
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <span class="rating-text">4.9</span>
                </div>
                <p class="synopsis">Mastering concentration in a noisy world. Draws on neuroscience and an...</p>
            </div>
            <div class="trending-action">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
            </div>
        </div>

        <!-- Trending 2 -->
        <div class="trending-card">
            <div class="trending-cover" style="background-color: #cbbba0;">
                <strong>Whimsical Wanderlust</strong>
                <span>Leo Brooks</span>
            </div>
            <div class="trending-info">
                <strong class="title">Whimsical Wanderlust</strong>
                <span class="author">Leo Brooks</span>
                <div class="rating-row">
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg-empty" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <span class="rating-text">4.2</span>
                </div>
                <p class="synopsis">Finding beauty in unexpected places. A lyrical travel memoir that tran...</p>
            </div>
            <div class="trending-action">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
            </div>
        </div>

        <!-- Trending 3 -->
        <div class="trending-card">
            <div class="trending-cover" style="background-color: #c9af98;">
                <strong>The Great Gatsby</strong>
                <span>F. Scott Fitzgerald</span>
            </div>
            <div class="trending-info">
                <strong class="title">The Great Gatsby</strong>
                <span class="author">F. Scott Fitzgerald</span>
                <div class="rating-row">
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <span class="rating-text">4.7</span>
                </div>
                <p class="synopsis">A portrait of the Jazz Age in all of its decadence and excess, capturi...</p>
            </div>
            <div class="trending-action">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
            </div>
        </div>

        <!-- Trending 4 -->
        <div class="trending-card">
            <div class="trending-cover" style="background-color: #c89d6e;">
                <strong>Dune</strong>
                <span>Frank Herbert</span>
            </div>
            <div class="trending-info">
                <strong class="title">Dune</strong>
                <span class="author">Frank Herbert</span>
                <div class="rating-row">
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <span class="rating-text">4.9</span>
                </div>
                <p class="synopsis">Set on the desert planet Arrakis, Dune is the story of Paul Atreides, ...</p>
            </div>
            <div class="trending-action">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"/></svg>
            </div>
        </div>
    </div>
</asp:Content>