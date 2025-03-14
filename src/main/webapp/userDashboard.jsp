<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ultra Modern Dashboard - Real Estate Agent Finder</title>

    <!-- CSS Dependencies -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css">

    <style>
        :root {
            --primary: #6366f1;
            --secondary: #4f46e5;
            --success: #22c55e;
            --danger: #ef4444;
            --warning: #f59e0b;
            --info: #3b82f6;
            --dark: #0f172a;
            --darker: #020617;
            --light: #f8fafc;
            --gray: #64748b;
            --card-bg: rgba(255, 255, 255, 0.05);
        }

        body {
            font-family: 'Plus Jakarta Sans', sans-serif;
            background: linear-gradient(135deg, var(--darker) 0%, var(--dark) 100%);
            color: var(--light);
            min-height: 100vh;
            overflow-x: hidden;
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 6px;
        }

        ::-webkit-scrollbar-track {
            background: var(--dark);
        }

        ::-webkit-scrollbar-thumb {
            background: var(--primary);
            border-radius: 3px;
        }

        /* Glass Effect */
        .glass {
            background: var(--card-bg);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 16px;
        }

        /* Layout */
        .app-container {
            display: grid;
            grid-template-columns: 260px 1fr;
            gap: 2rem;
            padding: 2rem;
        }

        /* Sidebar */
        .sidebar {
            background: var(--card-bg);
            backdrop-filter: blur(10px);
            border-radius: 24px;
            padding: 2rem;
            height: calc(100vh - 4rem);
            position: fixed;
            width: 260px;
        }

        .brand {
            display: flex;
            align-items: center;
            gap: 1rem;
            margin-bottom: 3rem;
        }

        .brand-logo {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            background: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
        }

        .nav-link {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 1rem;
            color: var(--gray);
            border-radius: 12px;
            transition: all 0.3s ease;
            margin-bottom: 0.5rem;
        }

        .nav-link:hover, .nav-link.active {
            background: var(--primary);
            color: white;
            transform: translateX(5px);
        }

        /* Main Content */
        .main-content {
            margin-left: 280px;
        }

        /* Header */
        .content-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 2rem;
        }

        .time-display {
            background: var(--card-bg);
            padding: 0.75rem 1.5rem;
            border-radius: 12px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            font-family: 'SF Mono', monospace;
            color: var(--primary);
        }

        .user-profile {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 0.5rem 1rem;
            background: var(--card-bg);
            border-radius: 12px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .user-profile:hover {
            background: rgba(99, 102, 241, 0.1);
        }

        .avatar {
            width: 40px;
            height: 40px;
            border-radius: 10px;
            object-fit: cover;
        }

        /* Cards */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 1.5rem;
            margin-bottom: 2rem;
        }

        .stat-card {
            background: var(--card-bg);
            padding: 1.5rem;
            border-radius: 16px;
            border: 1px solid rgba(255, 255, 255, 0.1);
            transition: all 0.3s ease;
        }

        .stat-card:hover {
            transform: translateY(-5px);
            border-color: var(--primary);
        }

        /* Property Slider */
        .property-slider {
            height: 400px;
            border-radius: 16px;
            overflow: hidden;
            margin-bottom: 2rem;
        }

        .slide-content {
            position: relative;
            height: 100%;
        }

        .property-image {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .property-details {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 2rem;
            background: linear-gradient(to top, rgba(2, 6, 23, 0.95), transparent);
        }

        /* Buttons */
        .btn-primary-custom {
            background: var(--primary);
            color: white;
            border: none;
            padding: 0.75rem 1.5rem;
            border-radius: 12px;
            transition: all 0.3s ease;
        }

        .btn-primary-custom:hover {
            background: var(--secondary);
            transform: translateY(-2px);
        }

        /* Animations */
        @keyframes slideUp {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .animate-slideUp {
            animation: slideUp 0.5s ease forwards;
        }

        /* Responsive Design */
        @media (max-width: 1024px) {
            .app-container {
                grid-template-columns: 1fr;
            }
            .sidebar {
                display: none;
            }
            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>
    <div class="app-container">
        <!-- Sidebar -->
        <aside class="sidebar">
            <div class="brand">
                <div class="brand-logo">
                    <i class="fas fa-home"></i>
                </div>
                <div>
                    <h5 class="mb-0">PropertyFinder</h5>
                    <small class="text-muted">Agent Connect</small>
                </div>
            </div>

            <nav>
                <a href="#" class="nav-link active">
                    <i class="fas fa-th-large"></i>
                    <span>Dashboard</span>
                </a>
                <a href="#" class="nav-link">
                    <i class="fas fa-search"></i>
                    <span>Browse Properties</span>
                </a>
                <a href="#" class="nav-link">
                    <i class="fas fa-calendar-alt"></i>
                    <span>Appointments</span>
                    <span class="badge bg-primary rounded-pill ms-auto">5</span>
                </a>
                <a href="#" class="nav-link">
                    <i class="fas fa-heart"></i>
                    <span>Favorites</span>
                    <span class="badge bg-danger rounded-pill ms-auto">12</span>
                </a>
                <a href="#" class="nav-link">
                    <i class="fas fa-comments"></i>
                    <span>Messages</span>
                    <span class="badge bg-success rounded-pill ms-auto">3</span>
                </a>
                <a href="#" class="nav-link">
                    <i class="fas fa-user-circle"></i>
                    <span>My Profile</span>
                </a>
                <a href="#" class="nav-link">
                    <i class="fas fa-cog"></i>
                    <span>Settings</span>
                </a>
                <a href="#" class="nav-link text-danger">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Logout</span>
                </a>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <!-- Header -->
            <div class="content-header">
                <div class="time-display glass">
                    <i class="fas fa-clock me-2"></i>
                    <span id="current-time">2025-03-14 17:48:12</span>
                </div>
                <div class="user-profile glass" data-bs-toggle="dropdown">
                    <img src="https://ui-avatars.com/api/?name=Krishmal2004&background=6366f1&color=fff" alt="User" class="avatar">
                    <div>
                        <h6 class="mb-0">Krishmal2004</h6>
                        <small class="text-muted">Premium Agent</small>
                    </div>
                    <i class="fas fa-chevron-down ms-3"></i>
                </div>
            </div>

            <!-- Stats Grid -->
            <div class="stats-grid">
                <div class="stat-card animate-slideUp" style="animation-delay: 0.1s">
                    <div class="d-flex justify-content-between mb-3">
                        <div class="stat-icon" style="color: var(--primary)">
                            <i class="fas fa-home fa-2x"></i>
                        </div>
                        <div class="stat-badge">
                            <span class="badge bg-primary">+15%</span>
                        </div>
                    </div>
                    <h3 class="mb-1">248</h3>
                    <p class="text-muted mb-0">Properties Viewed</p>
                </div>

                <div class="stat-card animate-slideUp" style="animation-delay: 0.2s">
                    <div class="d-flex justify-content-between mb-3">
                        <div class="stat-icon" style="color: var(--success)">
                            <i class="fas fa-calendar-check fa-2x"></i>
                        </div>
                        <div class="stat-badge">
                            <span class="badge bg-success">+8%</span>
                        </div>
                    </div>
                    <h3 class="mb-1">32</h3>
                    <p class="text-muted mb-0">Active Appointments</p>
                </div>

                <div class="stat-card animate-slideUp" style="animation-delay: 0.3s">
                    <div class="d-flex justify-content-between mb-3">
                        <div class="stat-icon" style="color: var(--warning)">
                            <i class="fas fa-star fa-2x"></i>
                        </div>
                        <div class="stat-badge">
                            <span class="badge bg-warning">+12%</span>
                        </div>
                    </div>
                    <h3 class="mb-1">4.8</h3>
                    <p class="text-muted mb-0">Average Rating</p>
                </div>

                <div class="stat-card animate-slideUp" style="animation-delay: 0.4s">
                    <div class="d-flex justify-content-between mb-3">
                        <div class="stat-icon" style="color: var(--info)">
                            <i class="fas fa-comments fa-2x"></i>
                        </div>
                        <div class="stat-badge">
                            <span class="badge bg-info">Active</span>
                        </div>
                    </div>
                    <h3 class="mb-1">156</h3>
                    <p class="text-muted mb-0">Client Messages</p>
                </div>
            </div>

            <!-- Property Showcase -->
            <div class="glass p-4 mb-4 animate-slideUp" style="animation-delay: 0.5s">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h5 class="mb-0">Featured Properties</h5>
                    <button class="btn btn-primary-custom">View All</button>
                </div>
                <div class="swiper property-slider">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <div class="slide-content">
                                <img src="https://images.unsplash.com/photo-1600585154340-be6161a56a0c?ixlib=rb-4.0.3" class="property-image" alt="Luxury Villa">
                                <div class="property-details">
                                    <h4>Luxury Villa in Colombo 7</h4>
                                    <p class="mb-3">4 Beds • 3 Baths • 3,500 sqft</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h5 class="mb-0">$850,000</h5>
                                        <button class="btn btn-primary-custom">Schedule Viewing</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Add more property slides as needed -->
                    </div>
                    <div class="swiper-pagination"></div>
                </div>
            </div>

            <!-- Recent Activities & Appointments -->
            <div class="row">
                <div class="col-lg-7 mb-4">
                    <div class="glass p-4 animate-slideUp" style="animation-delay: 0.6s">
                        <h5 class="mb-4">Recent Activities</h5>
                        <div class="activity-timeline">
                            <div class="activity-item d-flex gap-3 mb-3 pb-3 border-bottom border-light">
                                <div class="activity-icon bg-primary rounded-circle p-2">
                                    <i class="fas fa-check text-white"></i>
                                </div>
                                <div>
                                    <h6 class="mb-1">Property Viewing Confirmed</h6>
                                    <p class="mb-0">Luxury Villa - Colombo 7</p>
                                    <small class="text-muted">2 hours ago</small>
                                </div>
                            </div>
                            <!-- Add more activity items -->
                        </div>
                    </div>
                </div>
                
                <div class="col-lg-5 mb-4">
                    <div class="glass p-4 animate-slideUp" style="animation-delay: 0.7s">
                        <h5 class="mb-4">Upcoming Appointments</h5>
                        <div class="appointment-list">
                            <div class="appointment-item glass p-3 mb-3">
                                <div class="d-flex justify-content-between align-items-center">
                                    <div>
                                        <h6 class="mb-1">Villa Viewing</h6>
                                        <p class="mb-0 text-muted">
                                            <i class="fas fa-map-marker-alt me-2"></i>Colombo 7
                                            <i class="fas fa-clock ms-3 me-2"></i>10:00 AM
                                        </p>
                                    </div>
                                    <button class="btn btn-sm btn-primary-custom">Details</button>
                                </div>
                            </div>
                            <!-- Add more appointment items -->
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

    <script>
        // Initialize Swiper
        const propertySwiper = new Swiper('.property-slider', {
            loop: true,
            autoplay: {
                delay: 3000,
                disableOnInteraction: false,
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
            effect: 'fade',
            fadeEffect: {
                crossFade: true
            }
        });

        // Update time
        function updateTime() {
            document.getElementById('current-time').textContent = '2025-03-14 17:48:12';
        }
        setInterval(updateTime, 1000);

        // Initialize dropdowns
        var dropdownElementList = [].slice.call(document.querySelectorAll('[data-bs-toggle="dropdown"]'))
        var dropdownList = dropdownElementList.map(function (dropdownToggleEl) {
            return new bootstrap.Dropdown(dropdownToggleEl)
        });
    </script>
</body>
</html>