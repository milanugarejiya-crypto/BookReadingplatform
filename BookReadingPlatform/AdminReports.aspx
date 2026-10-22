<%@ Page Title="Reports & Analytics" Language="C#" MasterPageFile="~/Admin.Master" AutoEventWireup="true" CodeBehind="AdminReports.aspx.cs" Inherits="BookReadingPlatform.AdminReports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Header */
        .page-header { margin-bottom: 25px; }
        .page-header h1 { margin: 0 0 4px 0; font-size: 24px; color: #0f172a; font-weight: 800; }
        .page-header p { margin: 0; font-size: 13px; color: #94a3b8; }

        /* KPI Cards Grid */
        .reports-kpi-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 20px; margin-bottom: 30px; }
        .rk-card { background: white; border-radius: 16px; padding: 24px; border: 1px solid #edf2f7; box-shadow: 0 1px 3px rgba(0,0,0,0.02); display: flex; flex-direction: column; }
        .rk-value { font-size: 26px; font-weight: 800; color: #3b82f6; margin-bottom: 6px; line-height: 1; }
        .rk-title { font-size: 12px; font-weight: 700; color: #0f172a; margin-bottom: 4px; }
        .rk-sub { font-size: 11px; color: #94a3b8; }

        /* Report Table Container */
        .report-table-container { background: white; border-radius: 16px; border: 1px solid #edf2f7; box-shadow: 0 1px 3px rgba(0,0,0,0.02); overflow: hidden; margin-bottom: 40px; }
        
        .table-header-row { display: flex; justify-content: space-between; align-items: center; padding: 20px 25px; border-bottom: 1px solid #edf2f7; }
        .table-title { font-size: 16px; font-weight: 700; color: #0f172a; margin: 0; }
        
        .btn-export { background: #eff6ff; color: #3b82f6; border: none; padding: 8px 16px; border-radius: 8px; font-size: 12px; font-weight: 600; cursor: pointer; display: flex; align-items: center; gap: 6px; }

        /* Table Styling */
        .report-table { width: 100%; border-collapse: collapse; text-align: left; }
        .report-table th { background: #f8fafc; padding: 14px 25px; font-size: 11px; font-weight: 700; color: #94a3b8; text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 1px solid #edf2f7; }
        .report-table td { padding: 16px 25px; font-size: 13px; color: #0f172a; border-bottom: 1px solid #f8fafc; }
        .report-table tr:last-child td { border-bottom: none; }
        .report-table tr:hover { background: #fdfdfd; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="page-header">
        <h1>Reports & Analytics</h1>
        <p>Monthly performance overview</p>
    </div>

    <!-- 4 Summary KPI Cards -->
    <div class="reports-kpi-grid">
        <div class="rk-card">
            <div class="rk-value">₹1,56,000</div>
            <div class="rk-title">Total Revenue</div>
            <div class="rk-sub">vs ₹1.2L last year</div>
        </div>
        <div class="rk-card">
            <div class="rk-value">2,847</div>
            <div class="rk-title">Total Users</div>
            <div class="rk-sub">All time</div>
        </div>
        <div class="rk-card">
            <div class="rk-value">6,450</div>
            <div class="rk-title">Sessions</div>
            <div class="rk-sub">Last 30 days</div>
        </div>
        <div class="rk-card">
            <div class="rk-value">163</div>
            <div class="rk-title">New Books</div>
            <div class="rk-sub">In 2025</div>
        </div>
    </div>

    <!-- Monthly Report Table -->
    <div class="report-table-container">
        <div class="table-header-row">
            <h3 class="table-title">Monthly Report</h3>
            <button type="button" class="btn-export">
                <svg viewBox="0 0 24 24" width="14" height="14" stroke="currentColor" fill="none" stroke-width="2"><path d="M21 15v4a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2v-4"></path><polyline points="7 10 12 15 17 10"></polyline><line x1="12" y1="15" x2="12" y2="3"></line></svg>
                Export CSV
            </button>
        </div>

        <table class="report-table">
            <thead>
                <tr>
                    <th>Month</th>
                    <th>New Users</th>
                    <th>Sessions</th>
                    <th>Books Added</th>
                    <th>Revenue</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td style="font-weight: 600;">September 2025</td>
                    <td style="color: #64748b;">380</td>
                    <td style="color: #64748b;">1240</td>
                    <td style="color: #64748b;">48</td>
                    <td style="font-weight: 700; color: #10b981;">₹42,800</td>
                </tr>
                <tr>
                    <td style="font-weight: 600;">August 2025</td>
                    <td style="color: #64748b;">310</td>
                    <td style="color: #64748b;">980</td>
                    <td style="color: #64748b;">36</td>
                    <td style="font-weight: 700; color: #10b981;">₹35,600</td>
                </tr>
                <tr>
                    <td style="font-weight: 600;">July 2025</td>
                    <td style="color: #64748b;">280</td>
                    <td style="color: #64748b;">870</td>
                    <td style="color: &4e5568;; color: #64748b;">29</td>
                    <td style="font-weight: 700; color: #10b981;">₹31,200</td>
                </tr>
                <tr>
                    <td style="font-weight: 600;">June 2025</td>
                    <td style="color: #64748b;">220</td>
                    <td style="color: #64748b;">720</td>
                    <td style="color: #64748b;">22</td>
                    <td style="font-weight: 700; color: #10b981;">₹26,400</td>
                </tr>
            </tbody>
        </table>
    </div>

</asp:Content>