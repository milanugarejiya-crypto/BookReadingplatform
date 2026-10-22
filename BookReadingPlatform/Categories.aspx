<%@ Page Title="Categories" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Categories.aspx.cs" Inherits="BookReadingPlatform.Categories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Header Match */
        .header-top { display: flex; align-items: center; justify-content: space-between; margin-bottom: 40px; }
        .header-left { display: flex; align-items: center; }
        .header-dots { display: flex; gap: 6px; margin-right: 15px; }
        .dot { width: 8px; height: 8px; border-radius: 50%; }
        .dot-red { background-color: #fc8181; }
        .dot-yellow { background-color: #f6e05e; }
        .dot-green { background-color: #68d391; }
        .header-top h2 { margin: 0; font-size: 16px; color: #1a202c; font-weight: 700; letter-spacing: -0.2px; }
        
        .header-right { display: flex; gap: 10px; }
        .circle-btn { width: 32px; height: 32px; border-radius: 50%; border: 1px solid #e2e8f0; display: flex; align-items: center; justify-content: center; color: #718096; background: white; cursor: pointer; }
        .circle-btn svg { width: 14px; height: 14px; fill: none; stroke: currentColor; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }

        /* Page Title */
        .page-title { color: #5c6ac4; font-size: 28px; font-weight: 700; margin: 0 0 10px 0; letter-spacing: -0.5px; }
        .page-subtitle { color: #a0aec0; font-size: 14px; margin: 0 0 45px 0; }

        /* Categories Grid */
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 25px;
        }

        /* Card Design */
        .category-card {
            background: #ffffff;
            border-radius: 20px;
            padding: 35px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.02);
            border: 1px solid rgba(0,0,0,0.01);
            cursor: pointer;
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }
        .category-card:hover {
            transform: translateY(-4px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.05);
        }

        .icon-box {
            width: 64px;
            height: 64px;
            background-color: #eff6ff;
            border-radius: 16px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 20px;
        }
        .icon-box svg {
            width: 26px;
            height: 26px;
            stroke: #5c6ac4;
            stroke-width: 2;
            fill: none;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        .category-title {
            font-size: 15px;
            font-weight: 700;
            color: #1a202c;
            margin-bottom: 6px;
        }
        .category-count {
            font-size: 12px;
            color: #a0aec0;
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
            <h2>Categories</h2>
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

    <!-- Title Section -->
    <h1 class="page-title">Explore Worlds</h1>
    <p class="page-subtitle">Find your next favorite book by browsing through our curated collections.</p>

    <!-- Grid Layout -->
    <div class="categories-grid">
        
        <!-- Programming -->
        <div class="category-card">
            <div class="icon-box">
                <svg viewBox="0 0 24 24"><polyline points="16 18 22 12 16 6"></polyline><polyline points="8 6 2 12 8 18"></polyline></svg>
            </div>
            <div class="category-title">Programming</div>
            <div class="category-count">8 books</div>
        </div>

        <!-- Novels -->
        <div class="category-card">
            <div class="icon-box">
                <svg viewBox="0 0 24 24"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
            </div>
            <div class="category-title">Novels</div>
            <div class="category-count">8 books</div>
        </div>

        <!-- Science -->
        <div class="category-card">
            <div class="icon-box">
                <svg viewBox="0 0 24 24"><path d="M9 2v6.57l-4.72 8A2 2 0 0 0 6 20h12a2 2 0 0 0 1.72-3.43L15 8.57V2"></path><line x1="6" y1="2" x2="18" y2="2"></line><line x1="6" y1="14" x2="18" y2="14"></line></svg>
            </div>
            <div class="category-title">Science</div>
            <div class="category-count">8 books</div>
        </div>

        <!-- History -->
        <div class="category-card">
            <div class="icon-box">
                <svg viewBox="0 0 24 24"><path d="M3 12a9 9 0 1 0 9-9 9.75 9.75 0 0 0-6.74 2.74L3 8"></path><polyline points="3 3 3 8 8 8"></polyline><polyline points="12 7 12 12 15 15"></polyline></svg>
            </div>
            <div class="category-title">History</div>
            <div class="category-count">8 books</div>
        </div>

        <!-- Business -->
        <div class="category-card">
            <div class="icon-box">
                <svg viewBox="0 0 24 24"><line x1="18" y1="20" x2="18" y2="10"></line><line x1="12" y1="20" x2="12" y2="4"></line><line x1="6" y1="20" x2="6" y2="14"></line></svg>
            </div>
            <div class="category-title">Business</div>
            <div class="category-count">8 books</div>
        </div>

        <!-- AI -->
        <div class="category-card">
            <div class="icon-box">
                <svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"></circle><line x1="12" y1="2" x2="12" y2="5"></line><line x1="12" y1="19" x2="12" y2="22"></line><line x1="2" y1="12" x2="5" y2="12"></line><line x1="19" y1="12" x2="22" y2="12"></line></svg>
            </div>
            <div class="category-title">AI</div>
            <div class="category-count">8 books</div>
        </div>

    </div>

    <!-- Script to set the sidebar active state dynamically -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            const links = document.querySelectorAll('.nav-link');
            links.forEach(link => {
                link.classList.remove('active');
                if (link.innerText.trim() === 'Categories') {
                    link.classList.add('active');
                }
            });
        });
    </script>
</asp:Content>