<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>History Teknisi - Admin WFM</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    
    <style>
        .stats-card {
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        
        .stats-card:hover {
            transform: translateY(-5px);
        }
        
        .completion-rate {
            font-weight: bold;
        }
        
        .completion-rate.high {
            color: #28a745;
        }
        
        .completion-rate.medium {
            color: #ffc107;
        }
        
        .completion-rate.low {
            color: #dc3545;
        }
        
        .top-technician-badge {
            background: linear-gradient(45deg, #ffd700, #ffed4e);
            border-radius: 20px;
            padding: 5px 15px;
            font-size: 0.8em;
            font-weight: bold;
            color: #856404;
        }
        
        .table-hover tbody tr:hover {
            background-color: #f8f9fa;
        }
        
        .status-badge {
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8em;
            font-weight: bold;
        }
        
        .status-active {
            background-color: #d4edda;
            color: #155724;
        }
        
        .status-inactive {
            background-color: #f8d7da;
            color: #721c24;
        }
    </style>
</head>
<body class="bg-light">
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/dashboard">
                <i class="fas fa-tools me-2"></i>WFM Admin
            </a>
            
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/dashboard">
                    <i class="fas fa-tachometer-alt me-1"></i>Dashboard
                </a>
                <a class="nav-link active" href="${pageContext.request.contextPath}/admin/history">
                    <i class="fas fa-history me-1"></i>History
                </a>
                <a class="nav-link" href="${pageContext.request.contextPath}/logout">
                    <i class="fas fa-sign-out-alt me-1"></i>Logout
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <!-- Header -->
        <div class="row mb-4">
            <div class="col-12">
                <h2><i class="fas fa-history text-primary me-2"></i>History Teknisi</h2>
                <p class="text-muted">Riwayat dan statistik performa teknisi</p>
            </div>
        </div>

        <!-- Error Alert -->
        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <i class="fas fa-exclamation-triangle me-2"></i>${error}
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </c:if>

        <!-- Summary Statistics -->
        <div class="row mb-4">
            <div class="col-md-3 mb-3">
                <div class="card stats-card bg-primary text-white">
                    <div class="card-body text-center">
                        <i class="fas fa-users fa-2x mb-2"></i>
                        <h3>${totalTechnicians}</h3>
                        <p class="mb-0">Total Teknisi</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card stats-card bg-success text-white">
                    <div class="card-body text-center">
                        <i class="fas fa-user-check fa-2x mb-2"></i>
                        <h3>${activeTechnicians}</h3>
                        <p class="mb-0">Teknisi Aktif</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card stats-card bg-info text-white">
                    <div class="card-body text-center">
                        <i class="fas fa-ticket-alt fa-2x mb-2"></i>
                        <h3>${totalTicketsHandled}</h3>
                        <p class="mb-0">Total Ticket Ditangani</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card stats-card bg-warning text-white">
                    <div class="card-body text-center">
                        <i class="fas fa-check-circle fa-2x mb-2"></i>
                        <h3>${totalTicketsCompleted}</h3>
                        <p class="mb-0">Ticket Selesai</p>
                    </div>
                </div>
            </div>
        </div>

        <!-- Top Technician -->
        <c:if test="${not empty topTechnician}">
            <div class="row mb-4">
                <div class="col-12">
                    <div class="card stats-card">
                        <div class="card-body">
                            <div class="d-flex align-items-center">
                                <i class="fas fa-trophy fa-3x text-warning me-3"></i>
                                <div>
                                    <h5 class="mb-1">
                                        Teknisi Terbaik 
                                        <span class="top-technician-badge">
                                            <i class="fas fa-crown me-1"></i>TOP PERFORMER
                                        </span>
                                    </h5>
                                    <h4 class="text-primary mb-1">${topTechnician.username}</h4>
                                    <p class="text-muted mb-0">
                                        ${topTechnician.ticketsApproved} ticket selesai dari ${topTechnician.totalTicketsAssigned} total ticket
                                        <span class="ms-2">
                                            (<fmt:formatNumber value="${topTechnician.completionRate}" pattern="#.##"/>% completion rate)
                                        </span>
                                    </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:if>

        <!-- Technician Statistics Table -->
        <div class="row">
            <div class="col-12">
                <div class="card stats-card">
                    <div class="card-header bg-white">
                        <h5 class="mb-0">
                            <i class="fas fa-table me-2"></i>Statistik Detail Teknisi
                        </h5>
                    </div>
                    <div class="card-body">
                        <c:choose>
                            <c:when test="${not empty technicianStats}">
                                <div class="table-responsive">
                                    <table class="table table-hover">
                                        <thead class="table-dark">
                                            <tr>
                                                <th>ID</th>
                                                <th>Username</th>
                                                <th>WhatsApp</th>
                                                <th>Status</th>
                                                <th>Total Ticket</th>
                                                <th>In Progress</th>
                                                <th>Selesai</th>
                                                <th>Disetujui</th>
                                                <th>Completion Rate</th>
                                                <th>Aksi</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="tech" items="${technicianStats}" varStatus="status">
                                                <tr>
                                                    <td>${tech.id}</td>
                                                    <td>
                                                        <strong>${tech.username}</strong>
                                                        <c:if test="${topTechnician != null && tech.id == topTechnician.id}">
                                                            <i class="fas fa-crown text-warning ms-1" title="Top Performer"></i>
                                                        </c:if>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${not empty tech.whatsapp}">
                                                                <a href="https://wa.me/${tech.whatsapp}" target="_blank" class="text-success">
                                                                    <i class="fab fa-whatsapp me-1"></i>${tech.whatsapp}
                                                                </a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="text-muted">-</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <span class="status-badge ${tech.status == 'active' ? 'status-active' : 'status-inactive'}">
                                                            <c:choose>
                                                                <c:when test="${tech.status == 'active'}">
                                                                    <i class="fas fa-check-circle me-1"></i>Aktif
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="fas fa-times-circle me-1"></i>Tidak Aktif
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <span class="badge bg-primary">${tech.totalTicketsAssigned}</span>
                                                    </td>
                                                    <td>
                                                        <span class="badge bg-warning">${tech.ticketsInProgress}</span>
                                                    </td>
                                                    <td>
                                                        <span class="badge bg-info">${tech.ticketsCompleted}</span>
                                                    </td>
                                                    <td>
                                                        <span class="badge bg-success">${tech.ticketsApproved}</span>
                                                    </td>
                                                    <td>
                                                        <c:set var="rate" value="${tech.completionRate}" />
                                                        <span class="completion-rate ${rate >= 80 ? 'high' : (rate >= 50 ? 'medium' : 'low')}">
                                                            <fmt:formatNumber value="${rate}" pattern="#.##"/>%
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-sm btn-outline-primary" 
                                                                onclick="viewTechnicianDetail(${tech.id})" 
                                                                title="Lihat Detail">
                                                            <i class="fas fa-eye"></i>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="text-center py-5">
                                    <i class="fas fa-users fa-3x text-muted mb-3"></i>
                                    <h5 class="text-muted">Belum ada data teknisi</h5>
                                    <p class="text-muted">Data teknisi akan muncul setelah ada teknisi yang terdaftar</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        function viewTechnicianDetail(technic