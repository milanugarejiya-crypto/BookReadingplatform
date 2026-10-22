<%@ Page Title="My Library" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="MyLibrary.aspx.cs" Inherits="BookReadingPlatform.MyLibrary" %>

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
        .header-right { display: flex; gap: 10px; }
        .circle-btn { width: 36px; height: 36px; border-radius: 50%; background: #f8fafc; border: 1px solid #e2e8f0; display: flex; align-items: center; justify-content: center; color: #718096; cursor: pointer; }
        .circle-btn svg { width: 16px; height: 16px; fill: none; stroke: currentColor; stroke-width: 2; stroke-linecap: round; stroke-linejoin: round; }

        /* Page Intro */
        .page-title { font-size: 24px; color: #1a202c; font-weight: 700; margin: 0 0 6px 0; }
        .page-subtitle { font-size: 13px; color: #a0aec0; margin: 0 0 25px 0; }

        /* Filter Pills */
        .filter-pills { display: flex; gap: 12px; margin-bottom: 35px; }
        .f-pill { padding: 10px 20px; border-radius: 20px; font-size: 13px; font-weight: 600; cursor: pointer; border: 1px solid #e2e8f0; background: white; color: #4a5568; transition: 0.2s; }
        .f-pill.active { background: #5c6ac4; color: white; border-color: #5c6ac4; }

        /* Toolbar */
        .toolbar { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; }
        .book-count { font-size: 12px; font-weight: 700; color: #718096; text-transform: uppercase; letter-spacing: 1px; }
        .sort-box { display: flex; align-items: center; gap: 8px; font-size: 12px; color: #a0aec0; }
        .sort-select { background: white; border: 1px solid #e2e8f0; padding: 6px 12px; border-radius: 8px; font-size: 12px; color: #1a202c; font-weight: 600; display: flex; align-items: center; gap: 6px; cursor: pointer; }
        .sort-select svg { width: 14px; height: 14px; stroke: currentColor; fill: none; stroke-width: 2; }

        /* Grid */
        .library-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 25px; padding-bottom: 40px; }
        
        /* Card */
        .lib-card { display: flex; flex-direction: column; }
        .lib-cover { height: 210px; border-radius: 16px; padding: 15px; display: flex; flex-direction: column; position: relative; margin-bottom: 12px; color: white; }
        
        /* Cover Colors */
        .c-blue { background-color: #8fa3b4; }
        .c-green { background-color: #8fb492; }
        .c-pink { background-color: #b48f9a; }
        .c-slate { background-color: #8fa0b4; }
        .c-tan { background-color: #b49f8f; }
        .c-teal { background-color: #8fb4b2; }
        .c-sand { background-color: #c29a70; }
        .c-dark { background-color: #718292; }

        /* Cover Inner Elements */
        .cover-top { display: flex; justify-content: space-between; align-items: center; margin-bottom: auto; }
        .rating-pill { background: white; color: #1a202c; font-size: 11px; font-weight: 700; padding: 4px 8px; border-radius: 12px; display: flex; align-items: center; gap: 4px; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .rating-pill svg { width: 10px; height: 10px; fill: #ecc94b; }
        .heart-circle { width: 24px; height: 24px; background: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; box-shadow: 0 2px 4px rgba(0,0,0,0.1); }
        .heart-circle svg { width: 12px; height: 12px; }
        .h-red { fill: #e53e3e; }
        .h-gray { stroke: #a0aec0; fill: none; stroke-width: 2; }

        .cover-center { display: flex; justify-content: center; align-items: center; opacity: 0.8; margin-bottom: 10px; }
        .cover-center svg { width: 28px; height: 28px; stroke: white; fill: none; stroke-width: 1.5; }

        .cover-text { text-align: center; margin-bottom: auto; }
        .cover-text strong { display: block; font-size: 13px; font-weight: 700; margin-bottom: 2px; }
        .cover-text span { font-size: 10px; opacity: 0.8; }

        .cover-bottom { background: rgba(0,0,0,0.15); border-radius: 8px; padding: 8px 12px; display: flex; justify-content: space-between; font-size: 10px; font-weight: 600; margin-top: auto; }

        /* Card Meta */
        .genre-tag { display: inline-block; padding: 4px 8px; border-radius: 12px; background: #f8fafc; color: #4a5568; font-size: 10px; font-weight: 600; margin-bottom: 8px; border: 1px solid #e2e8f0; }
        .book-title { font-size: 14px; font-weight: 700; color: #1a202c; margin: 0 0 2px 0; }
        .book-author { font-size: 12px; color: #a0aec0; margin: 0 0 15px 0; }

        /* Buttons */
        .btn-action { width: 100%; padding: 10px; border-radius: 10px; font-size: 12px; font-weight: 600; display: flex; align-items: center; justify-content: center; gap: 6px; cursor: pointer; border: none; }
        .btn-action svg { width: 14px; height: 14px; stroke: currentColor; fill: none; stroke-width: 2; }
        .btn-primary { background: #5c6ac4; color: white; }
        .btn-secondary { background: #f8fafc; color: #4a5568; border: 1px solid #e2e8f0; }
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
        </div>
        <div class="header-right">
            <div class="circle-btn"><svg viewBox="0 0 24 24"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg></div>
            <div class="circle-btn"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="1"></circle><circle cx="12" cy="5" r="1"></circle><circle cx="12" cy="19" r="1"></circle></svg></div>
        </div>
    </div>

    <!-- Intro -->
    <h1 class="page-title">My Library</h1>
    <p class="page-subtitle">All your saved and reading books in one place.</p>

    <!-- Filters -->
    <div class="filter-pills">
        <div class="f-pill active">All Books (8)</div>
        <div class="f-pill">Currently Reading</div>
        <div class="f-pill">Completed</div>
        <div class="f-pill">Want to Read</div>
    </div>

    <!-- Toolbar -->
    <div class="toolbar">
        <div class="book-count">8 Books</div>
        <div class="sort-box">
            Sort by: 
            <div class="sort-select">
                Recently Added
                <svg viewBox="0 0 24 24"><polyline points="6 9 12 15 18 9"></polyline></svg>
            </div>
        </div>
    </div>

    <!-- Library Grid -->
    <div class="library-grid">
        
        <!-- Book 1 -->
        <div class="lib-card">
            <div class="lib-cover c-blue">
                <div class="cover-top">
                    <div class="rating-pill"><svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg> 4.8</div>
                    <div class="heart-circle"><svg class="h-red" viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg></div>
                </div>
                <div class="cover-center"><svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg></div>
                <div class="cover-text"><strong>The Silent Echo</strong><span>L.J. Aria</span></div>
                <div class="cover-bottom"><span>284 Pages</span><span>68% Done</span></div>
            </div>
            <span class="genre-tag">Fantasy</span>
            <h4 class="book-title">The Silent Echo</h4>
            <p class="book-author">L.J. Aria</p>
            <button class="btn-action btn-primary"><svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg> Continue</button>
        </div>

        <!-- Book 2 -->
        <div class="lib-card">
            <div class="lib-cover c-green">
                <div class="cover-top">
                    <div class="rating-pill"><svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg> 4.5</div>
                    <div class="heart-circle"><svg class="h-gray" viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg></div>
                </div>
                <div class="cover-center"><svg viewBox="0 0 24 24"><polyline points="16 18 22 12 16 6"></polyline><polyline points="8 6 2 12 8 18"></polyline></svg></div>
                <div class="cover-text"><strong>Ancient Code</strong><span>Jane Smith</span></div>
                <div class="cover-bottom"><span>312 Pages</span><span>34% Done</span></div>
            </div>
            <span class="genre-tag">Sci-Fi</span>
            <h4 class="book-title">Ancient Code</h4>
            <p class="book-author">Jane Smith</p>
            <button class="btn-action btn-primary"><svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg> Continue</button>
        </div>

        <!-- Book 3 -->
        <div class="lib-card">
            <div class="lib-cover c-pink">
                <div class="cover-top">
                    <div class="rating-pill"><svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg> 4.6</div>
                    <div class="heart-circle"><svg class="h-red" viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg></div>
                </div>
                <div class="cover-center"><svg viewBox="0 0 24 24"><path d="M17.5 19H9a7 7 0 1 1 6.71-9h1.79a4.5 4.5 0 1 1 0 9z"></path></svg></div>
                <div class="cover-text"><strong>Echoes of Eternity</strong><span>Elena Richardson</span></div>
                <div class="cover-bottom"><span>256 Pages</span><span>Completed</span></div>
            </div>
            <span class="genre-tag">Romance</span>
            <h4 class="book-title">Echoes of Eternity</h4>
            <p class="book-author">Elena Richardson</p>
            <button class="btn-action btn-secondary"><svg viewBox="0 0 24 24"><polyline points="1 4 1 10 7 10"></polyline><polyline points="23 20 23 14 17 14"></polyline><path d="M20.49 9A9 9 0 0 0 5.64 5.64L1 10m22 4l-4.64 4.36A9 9 0 0 1 3.51 15"></path></svg> Re-read</button>
        </div>

        <!-- Book 4 -->
        <div class="lib-card">
            <div class="lib-cover c-slate">
                <div class="cover-top">
                    <div class="rating-pill"><svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg> 4.5</div>
                    <div class="heart-circle"><svg class="h-gray" viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg></div>
                </div>
                <div class="cover-center"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg></div>
                <div class="cover-text"><strong>The Silent Algorithm</strong><span>Marcus Vance</span></div>
                <div class="cover-bottom"><span>398 Pages</span><span>Completed</span></div>
            </div>
            <span class="genre-tag">Technology</span>
            <h4 class="book-title">The Silent Algorithm</h4>
            <p class="book-author">Marcus Vance</p>
            <button class="btn-action btn-secondary"><svg viewBox="0 0 24 24"><polyline points="1 4 1 10 7 10"></polyline><polyline points="23 20 23 14 17 14"></polyline><path d="M20.49 9A9 9 0 0 0 5.64 5.64L1 10m22 4l-4.64 4.36A9 9 0 0 1 3.51 15"></path></svg> Re-read</button>
        </div>

        <!-- Book 5 -->
        <div class="lib-card">
            <div class="lib-cover c-tan">
                <div class="cover-top">
                    <div class="rating-pill"><svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg> 4.9</div>
                    <div class="heart-circle"><svg class="h-red" viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg></div>
                </div>
                <div class="cover-center"><svg viewBox="0 0 24 24"><path d="M9 21h6"></path><path d="M10 17v-1a4 4 0 0 1 4-4 4 4 0 0 0 2-7.5 4 4 0 0 0-6.8-2 4 4 0 0 0 .8 7.5 4 4 0 0 1-4 4v1"></path></svg></div>
                <div class="cover-text"><strong>Focus Redefined</strong><span>Rahul Mehta</span></div>
                <div class="cover-bottom"><span>210 Pages</span><span>Want to Read</span></div>
            </div>
            <span class="genre-tag">Self-Help</span>
            <h4 class="book-title">Focus Redefined</h4>
            <p class="book-author">Rahul Mehta</p>
            <button class="btn-action btn-primary"><svg viewBox="0 0 24 24"><polygon points="5 3 19 12 5 21 5 3"></polygon></svg> Start Reading</button>
        </div>

        <!-- Book 6 -->
        <div class="lib-card">
            <div class="lib-cover c-teal">
                <div class="cover-top">
                    <div class="rating-pill"><svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg> 4.2</div>
                    <div class="heart-circle"><svg class="h-gray" viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg></div>
                </div>
                <div class="cover-center"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="10"></circle><polygon points="16.24 7.76 14.12 14.12 7.76 16.24 9.88 9.88 16.24 7.76"></polygon></svg></div>
                <div class="cover-text"><strong>Whimsical Wanderlust</strong><span>Leo Brooks</span></div>
                <div class="cover-bottom"><span>344 Pages</span><span>Want to Read</span></div>
            </div>
            <span class="genre-tag">Travel</span>
            <h4 class="book-title">Whimsical Wanderlust</h4>
            <p class="book-author">Leo Brooks</p>
            <button class="btn-action btn-primary"><svg viewBox="0 0 24 24"><polygon points="5 3 19 12 5 21 5 3"></polygon></svg> Start Reading</button>
        </div>

        <!-- Book 7 -->
        <div class="lib-card">
            <div class="lib-cover c-sand">
                <div class="cover-top">
                    <div class="rating-pill"><svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg> 4.9</div>
                    <div class="heart-circle"><svg class="h-red" viewBox="0 0 24 24"><path d="M12 21.35l-1.45-1.32C5.4 15.36 2 12.28 2 8.5 2 5.42 4.42 3 7.5 3c1.74 0 3.41.81 4.5 2.09C13.09 3.81 14.76 3 16.5 3 19.58 3 22 5.42 22 8.5c0 3.78-3.4 6.86-8.55 11.54L12 21.35z"/></svg></div>
                </div>
                <div class="cover-center"><svg viewBox="0 0 24 24"><circle cx="12" cy="12" r="5"></circle><line x1="12" y1="1" x2="12" y2="3"></line><line x1="12" y1="21" x2="12" y2="23"></line><line x1="4.22" y1="4.22" x2="5.64" y2="5.64"></line><line x1="18.36" y1="18.36" x2="19.78" y2="19.78"></line><line x1="1" y1="12" x2="3" y2="12"></line><line x1="21" y1="12" x2="23" y2="12"></line><line x1="4.22" y1="19.78" x2="5.64" y2="18.36"></line><line x1="18.36" y1="5.64" x2="19.78" y2="4.22"></line></svg></div>
                <div class="cover-text"><strong>Dune</strong><span>Frank Herbert</span></div>
                <div class="cover-bottom"><span>688 Pages</span><span>15% Done</span></div>
            </div>
            <span class="genre-tag">Classic Sci-Fi</span>
            <h4 class="book-title">Dune</h4>
            <p class="book-author">Frank Herbert</p>
            <button class="btn-action btn-primary"><svg viewBox="0 0 24 24"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg> Continue</button>
        </div>

        <!-- Book 8 -->
        <div class="lib-card">
            <div class="lib-cover c-dark">
                <div class="cover-top">
                    <div class="rating-pill"><svg viewBox="0 0 24 24"><path d="M12 17.27L18.18 21l-1.64-7.03L22 9.24l-7.19-.61L12 2 9.19 8.63 2 9.24l5.46 4.73L5.82 21z"/></svg> 4.7</div>
                    <div class="heart-circle"><svg class="h-gray" viewBox="0 0 24 24"><path d="M20.84 4.61a5.5 5.5 0 0 0-7.78 0L12 5.67l-1.06-1.06a5.5 5.5 0 0 0-7.78 7.78l1.06 1.06L12 21.23l7.78-7.78 1.06-1.06a5.5 5.5 0 0 0 0-7.78z"></path></svg></div>
                </div>
                <div class="cover-center"><svg viewBox="0 0 24 24"><path d="M2 3h6a4 4 0 0 1 4 4v14a3 3 0 0 0-3-3H2z"></path><path d="M22 3h-6a4 4 0 0 0-4 4v14a3 3 0 0 1 3-3h7z"></path></svg></div>
                <div class="cover-text"><strong>The Great Gatsby</strong><span>F. Scott Fitzgerald</span></div>
                <div class="cover-bottom"><span>180 Pages</span><span>Completed</span></div>
            </div>
            <span class="genre-tag">Classic Lit</span>
            <h4 class="book-title">The Great Gatsby</h4>
            <p class="book-author">F. Scott Fitzgerald</p>
            <button class="btn-action btn-secondary"><svg viewBox="0 0 24 24"><polyline points="1 4 1 10 7 10"></polyline><polyline points="23 20 23 14 17 14"></polyline><path d="M20.49 9A9 9 0 0 0 5.64 5.64L1 10m22 4l-4.64 4.36A9 9 0 0 1 3.51 15"></path></svg> Re-read</button>
        </div>

    </div>
</asp:Content>