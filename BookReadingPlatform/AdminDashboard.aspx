<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="BookReadingPlatform.AdminDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Header */
        .page-header { margin-bottom: 35px; }
        .page-header h1 { margin: 0 0 5px 0; font-size: 28px; color: #0f172a; font-weight: 800; letter-spacing: -0.5px; }
        .page-header p { margin: 0; font-size: 14px; color: #94a3b8; }

        /* KPI Grid */
        .kpi-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; margin-bottom: 30px; }
        .kpi-card { background: white; border-radius: 16px; padding: 25px; box-shadow: 0 1px 3px rgba(0,0,0,0.02); display: flex; align-items: center; gap: 20px; }
        
        .kpi-icon { width: 56px; height: 56px; border-radius: 16px; display: flex; align-items: center; justify-content: center; flex-shrink: 0; }
        .kpi-icon svg { width: 24px; height: 24px; stroke-width: 2; fill: none; stroke: currentColor; }
        
        .kpi-blue { background: #eff6ff; color: #3b82f6; }
        .kpi-green { background: #f0fdf4; color: #10b981; }
        .kpi-purple { background: #faf5ff; color: #a855f7; }
        .kpi-yellow { background: #fefce8; color: #eab308; }
        
        .kpi-info { display: flex; flex-direction: column; }
        .kpi-title { font-size: 12px; color: #94a3b8; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 4px; }
        .kpi-value { font-size: 24px; color: #0f172a; font-weight: 800; margin-bottom: 2px; line-height: 1; }
        .kpi-trend { font-size: 12px; color: #94a3b8; }
        .kpi-trend.positive { color: #10b981; }

        /* Charts Grid */
        .charts-grid { display: grid; grid-template-columns: 2fr 1fr; gap: 20px; }
        
        .chart-card { background: white; border-radius: 16px; padding: 30px; box-shadow: 0 1px 3px rgba(0,0,0,0.02); display: flex; flex-direction: column; }
        .chart-header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 40px; }
        .chart-titles h3 { margin: 0 0 4px 0; font-size: 18px; color: #0f172a; font-weight: 700; }
        .chart-titles p { margin: 0; font-size: 12px; color: #94a3b8; }
        .btn-report { background: #eff6ff; color: #3b82f6; border: none; padding: 6px 16px; border-radius: 20px; font-size: 12px; font-weight: 600; cursor: pointer; }
        
        /* Bar Chart - User Growth */
        .bar-chart-area { flex-grow: 1; display: flex; align-items: flex-end; justify-content: space-between; gap: 15px; height: 180px; padding-top: 20px; }
        .bar-col { display: flex; flex-direction: column; align-items: center; justify-content: flex-end; flex-grow: 1; height: 100%; gap: 10px; }
        .bar { width: 100%; background: #cddbfe; border-radius: 6px 6px 0 0; transition: 0.3s; }
        .bar.active { background: #3b82f6; }
        .bar-label { font-size: 11px; color: #94a3b8; font-weight: 500; }

        /* Bar Chart - Reading Activity */
        .activity-bars { display: flex; align-items: flex-end; justify-content: space-between; gap: 8px; height: 100px; margin-bottom: 25px; }
        .a-bar { flex-grow: 1; background: #bbf7d0; border-radius: 4px 4px 0 0; }
        .a-bar.active { background: #10b981; }
        
        .activity-stats { display: flex; justify-content: space-between; align-items: flex-end; border-top: 1px solid #f1f5f9; padding-top: 20px; }
        .a-stat-left h4 { margin: 0 0 2px 0; font-size: 24px; color: #0f172a; font-weight: 800; line-height: 1; }
        .a-stat-left p { margin: 0; font-size: 12px; color: #94a3b8; }
        .a-stat-right { text-align: right; }
        .a-stat-right h4 { margin: 0 0 2px 0; font-size: 16px; color: #10b981; font-weight: 700; line-height: 1; }
        .a-stat-right p { margin: 0; font-size: 12px; color: #94a3b8; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h1>Dashboard</h1>
        <p>Welcome back, Super Admin</p>
    </div>

    <!-- KPI Cards -->
    <div class="kpi-grid">
        <div class="kpi-card">
            <div class="kpi-icon kpi-blue">
                <svg viewBox="0 0 24 24"><path d="M17 21v-2a4 4 0 0 0-4-4H5a4 4 0 0 0-4 4v2"></path><circle cx="9" cy="7" r="4"></circle><path d="M23 21v-2a4 4 0 0 0-3-3.87"></path><path d="M16 3.13a4 4 0 0 1 0 7.75"></path></svg>
            </div>
            <div class="kpi-info">
                <span class="kpi-title">Total Users</span>
                <span class="kpi-value">2,847</span>
                <span class="kpi-trend">+12% this month</span>
            </div>
        </div>
        
        <div class="kpi-card">
            <div class="kpi-icon kpi-green">
                <svg viewBox="0 0 24 24"><path d="M19 21l-7-5-7 5V5a2 2 0 0 1 2-2h10a2 2 0 0 1 2 2z"></path></svg>
            </div>
            <div class="kpi-info">
                <span class="kpi-title">Total Books</span>
                <span class="kpi-value">1,284</span>
                <span class="kpi-trend">+8 this week</span>
            </div>
        </div>

        <div class="kpi-card">
            <div class="kpi-icon kpi-purple">
                <svg viewBox="0 0 24 24"><line x1="8" y1="6" x2="21" y2="6"></line><line x1="8" y1="12" x2="21" y2="12"></line><line x1="8" y1="18" x2="21" y2="18"></line><line x1="3" y1="6" x2="3.01" y2="6"></line><line x1="3" y1="12" x2="3.01" y2="12"></line><line x1="3" y1="18" x2="3.01" y2="18"></line></svg>
            </div>
            <div class="kpi-info">
                <span class="kpi-title">Active Readers</span>
                <span class="kpi-value">891</span>
                <span class="kpi-trend">Online right now</span>
            </div>
        </div>

        <div class="kpi-card">
            <div class="kpi-icon kpi-yellow">
                <svg viewBox="0 0 24 24" style="fill:currentColor; stroke:none;"><polygon points="12 2 15.09 8.26 22 9.27 17 14.14 18.18 21.02 12 17.77 5.82 21.02 7 14.14 2 9.27 8.91 8.26 12 2"></polygon></svg>
            </div>
            <div class="kpi-info">
                <span class="kpi-title">Premium Users</span>
                <span class="kpi-value">438</span>
                <span class="kpi-trend">+5% vs last month</span>
            </div>
        </div>
    </div>

    <!-- Charts Area -->
    <div class="charts-grid">
        
        <!-- User Growth Chart -->
        <div class="chart-card">
            <div class="chart-header">
                <div class="chart-titles">
                    <h3>User Growth</h3>
                    <p>New registrations per month</p>
                </div>
                <button class="btn-report">View Report</button>
            </div>
            <div class="bar-chart-area">
                <div class="bar-col"><div class="bar" style="height: 35%;"></div><span class="bar-label">Jan</span></div>
                <div class="bar-col"><div class="bar" style="height: 45%;"></div><span class="bar-label">Feb</span></div>
                <div class="bar-col"><div class="bar" style="height: 40%;"></div><span class="bar-label">Mar</span></div>
                <div class="bar-col"><div class="bar" style="height: 55%;"></div><span class="bar-label">Apr</span></div>
                <div class="bar-col"><div class="bar" style="height: 70%;"></div><span class="bar-label">May</span></div>
                <div class="bar-col"><div class="bar" style="height: 75%;"></div><span class="bar-label">Jun</span></div>
                <div class="bar-col"><div class="bar active" style="height: 95%;"></div><span class="bar-label">Jul</span></div>
            </div>
        </div>

        <!-- Reading Activity Chart -->
        <div class="chart-card">
            <div class="chart-header">
                <div class="chart-titles">
                    <h3>Reading Activity</h3>
                    <p>Sessions this week</p>
                </div>
            </div>
            
            <div class="activity-bars">
                <div class="a-bar" style="height: 40%;"></div>
                <div class="a-bar" style="height: 50%;"></div>
                <div class="a-bar" style="height: 45%;"></div>
                <div class="a-bar" style="height: 60%;"></div>
                <div class="a-bar" style="height: 55%;"></div>
                <div class="a-bar active" style="height: 80%;"></div>
            </div>
            
            <div class="activity-stats">
                <div class="a-stat-left">
                    <h4>160</h4>
                    <p>Today</p>
                </div>
                <div class="a-stat-right">
                    <h4>+14%</h4>
                    <p>vs last week</p>
                </div>
            </div>
        </div>

    </div>

</asp:Content>