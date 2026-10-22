<%@ Page Title="Favorites" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Favorites.aspx.cs" Inherits="BookReadingPlatform.Favorites" %>

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
        
        .header-right { display: flex; }
        .circle-btn { width: 36px; height: 36px; border-radius: 50%; background: #f8fafc; border: 1px solid #e2e8f0; display: flex; align-items: center; justify-content: center; color: #718096; cursor: pointer; }
        .circle-btn svg { width: 16px; height: 16px; fill: none; stroke: currentColor; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }

        .subtitle { font-size: 13px; color: #a0aec0; margin-bottom: 25px; font-weight: 500; }

        /* List Layout */
        .favorites-list {
            display: flex;
            flex-direction: column;
            gap: 20px;
        }

        /* Card Styling */
        .fav-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 20px;
            display: flex;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.02);
            border: 1px solid rgba(0,0,0,0.03);
            position: relative;
        }

        /* Book Cover Graphic */
        .fav-cover {
            width: 100px;
            height: 140px;
            border-radius: 12px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            padding: 12px;
            box-sizing: border-box;
            margin-right: 30px;
            text-align: center;
        }
        .cover-blue { background-color: #cbd5e1; }
        .cover-pink { background-color: #d8b4be; }

        .cover-icon { width: 16px; height: 16px; margin-bottom: 20px; fill: rgba(0,0,0,0.2); }
        .cover-title { font-size: 12px; font-weight: 700; color: #1a202c; margin-bottom: 4px; line-height: 1.2; }
        .cover-author { font-size: 9px; color: #4a5568; }

        /* Book Info Details */
        .fav-info { flex-grow: 1; }
        .fav-title { font-size: 18px; font-weight: 700; color: #1a202c; margin-bottom: 6px; margin-top: 0; }
        .fav-author { font-size: 13px; color: #a0aec0; margin-bottom: 12px; }
        
        .rating-row { display: flex; align-items: center; gap: 4px; margin-bottom: 16px; }
        .star-svg { width: 14px; height: 14px; fill: #ecc94b; }
        .star-svg-empty { width: 14px; height: 14px; fill: #e2e8f0; }
        .rating-text { font-size: 13px; color: #4a5568; font-weight: 600; margin-left: 4px; }

        /* Buttons */
        .btn-read {
            background-color: #5c6ac4;
            color: white;
            border: none;
            padding: 10px 24px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 13px;
            cursor: pointer;
        }
        .btn-read:hover { background-color: #4c51bf; }

        .btn-heart {
            width: 44px;
            height: 44px;
            background-color: #fef2f2;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            position: absolute;
            right: 30px;
            top: 50%;
            transform: translateY(-50%);
            cursor: pointer;
        }
        .btn-heart svg { width: 20px; height: 20px; fill: #e53e3e; }
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
            <h2>My Favorites</h2>
        </div>
        <div class="header-right">
            <div class="circle-btn">
                <svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>
            </div>
        </div>
    </div>

    <!-- Subtitle -->
    <div class="subtitle">2 saved books</div>

    <!-- Favorites List -->
    <div class="favorites-list">
        
        <!-- Book 1: The Silent Echo -->
        <div class="fav-card">
            <div class="fav-cover cover-blue">
                <svg class="cover-icon" viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                <div class="cover-title">The Silent<br/>Echo</div>
                <div class="cover-author">L.J. Aria</div>
            </div>
            <div class="fav-info">
                <h3 class="fav-title">The Silent Echo</h3>
                <div class="fav-author">L.J. Aria</div>
                <div class="rating-row">
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <span class="rating-text">4.8</span>
                </div>
                <button class="btn-read">Read Now</button>
            </div>
            <div class="btn-heart">
                <svg viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
            </div>
        </div>

        <!-- Book 2: Echoes of Eternity -->
        <div class="fav-card">
            <div class="fav-cover cover-pink">
                <svg class="cover-icon" viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                <div class="cover-title">Echoes of<br/>Eternity</div>
                <div class="cover-author">Elena Richardson</div>
            </div>
            <div class="fav-info">
                <h3 class="fav-title">Echoes of Eternity</h3>
                <div class="fav-author">Elena Richardson</div>
                <div class="rating-row">
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <svg class="star-svg-empty" viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg>
                    <span class="rating-text">4.6</span>
                </div>
                <button class="btn-read">Read Now</button>
            </div>
            <div class="btn-heart">
                <svg viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg>
            </div>
        </div>

    </div>

    <!-- Script to set the sidebar active state dynamically -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const links = document.querySelectorAll('.nav-link');
            links.forEach(link => {
                link.classList.remove('active');
                if (link.innerText.trim() === 'Favorites') {
                    link.classList.add('active');
                }
            });
        });
    </script>
</asp:Content>