<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Agent Search - Real Estate Agent Finder</title>

    <!-- CSS Dependencies -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

    <style>
        :root {
            --dark-blue: #0a1f44;
            --darker-blue: #091632;
            --deepest-blue: #060d1f;
            --accent-blue: #4a90e2;
            --light-blue: #84ceeb;
            --text-light: #ffffff;
            --text-muted: #a0aec0;
            --glass-bg: rgba(10, 31, 68, 0.95);
            --glass-border: rgba(255, 255, 255, 0.1);
            --card-bg: rgba(9, 22, 50, 0.9);
        }

        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(135deg, var(--deepest-blue) 0%, var(--dark-blue) 100%);
            color: var(--text-light);
            min-height: 100vh;
        }

        #particles-js {
            position: fixed;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
            z-index: 0;
        }

        .content-wrapper {
            position: relative;
            z-index: 1;
            padding: 2rem 0;
        }

        /* Search Form Styles */
        .search-container {
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            border-radius: 15px;
            padding: 2rem;
            border: 1px solid var(--glass-border);
            margin-bottom: 2rem;
        }

        .form-control, .form-select {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid var(--glass-border);
            color: var(--text-light);
            padding: 0.8rem;
            border-radius: 10px;
        }

        .form-control:focus, .form-select:focus {
            background: rgba(255, 255, 255, 0.15);
            border-color: var(--accent-blue);
            box-shadow: 0 0 0 0.2rem rgba(74, 144, 226, 0.25);
            color: var(--text-light);
        }

        .select2-container--default .select2-selection--single {
            background: rgba(255, 255, 255, 0.1);
            border: 1px solid var(--glass-border);
            border-radius: 10px;
            height: 45px;
            padding: 8px;
            color: var(--text-light);
        }

        .select2-container--default .select2-selection--single .select2-selection__rendered {
            color: var(--text-light);
        }

        .select2-dropdown {
            background: var(--glass-bg);
            border: 1px solid var(--glass-border);
        }

        .select2-container--default .select2-results__option {
            color: var(--text-light);
            padding: 8px;
        }

        .select2-container--default .select2-results__option--highlighted[aria-selected] {
            background-color: var(--accent-blue);
        }

        /* Agent Card Styles */
        .agent-card {
            background: var(--card-bg);
            border-radius: 15px;
            border: 1px solid var(--glass-border);
            transition: all 0.3s ease;
            margin-bottom: 1.5rem;
        }

        .agent-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .agent-avatar {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            border: 2px solid var(--accent-blue);
            padding: 2px;
        }

        .availability-badge {
            position: absolute;
            top: 10px;
            right: 10px;
            padding: 5px 10px;
            border-radius: 20px;
            font-size: 0.8rem;
        }

        .badge-available {
            background: rgba(40, 167, 69, 0.2);
            color: #51cf66;
            border: 1px solid rgba(40, 167, 69, 0.3);
        }

        .badge-busy {
            background: rgba(220, 53, 69, 0.2);
            color: #ff6b6b;
            border: 1px solid rgba(220, 53, 69, 0.3);
        }

        /* Current Time Display */
        .current-time {
            position: fixed;
            top: 20px;
            right: 20px;
            background: var(--glass-bg);
            backdrop-filter: blur(10px);
            padding: 8px 15px;
            border-radius: 20px;
            border: 1px solid var(--glass-border);
            color: var(--accent-blue);
            z-index: 1000;
        }

        /* Animation */
        .float-animation {
            animation: floating 3s ease-in-out infinite;
        }

        @keyframes floating {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0px); }
        }

        /* Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
        }

        ::-webkit-scrollbar-track {
            background: var(--darker-blue);
        }

        ::-webkit-scrollbar-thumb {
            background: var(--accent-blue);
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: var(--light-blue);
        }
    </style>
</head>
<body>
    <!-- Particle Effect Container -->
    <div id="particles-js"></div>

    <!-- Current Time Display -->
    <div class="current-time animate__animated animate__fadeIn">
        <i class="fas fa-clock me-2"></i>
        <span id="current-time">2025-03-14 17:11:26</span>
    </div>

    <div class="content-wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-dark mb-4">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">
                    <i class="fas fa-home me-2"></i>Real Estate Agent Finder
                </a>
                <div class="ms-auto d-flex align-items-center">
                    <div class="user-info me-3">
                        <span class="text-light">
                            <i class="fas fa-user me-2"></i>
                            <%= session.getAttribute("user") != null ? session.getAttribute("user") : "Krishmal2004" %>
                        </span>
                    </div>
                </div>
            </div>
        </nav>

        <div class="container">
            <!-- Search Section -->
            <div class="search-container animate__animated animate__fadeInDown">
                <h2 class="mb-4"><i class="fas fa-calendar-alt me-2"></i>Schedule Appointment</h2>
                <div class="row g-3">
                    <div class="col-md-4">
                        <label class="form-label">Location</label>
                        <select class="form-select location-select">
                            <option value="">Select Location</option>
                            <option value="colombo">Colombo</option>
                            <option value="gampaha">Gampaha</option>
                            <option value="kandy">Kandy</option>
                            <option value="galle">Galle</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Date & Time</label>
                        <input type="text" class="form-control" id="appointment-datetime" placeholder="Select Date & Time">
                    </div>
                    <div class="col-md-4">
                        <label class="form-label">Property Type</label>
                        <select class="form-select">
                            <option value="">Select Property Type</option>
                            <option value="residential">Residential</option>
                            <option value="commercial">Commercial</option>
                            <option value="industrial">Industrial</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Appointments List -->
            <div class="row">
                <div class="col-12">
                    <div class="card animate__animated animate__fadeInUp">
                        <div class="card-header d-flex justify-content-between align-items-center">
                            <h5 class="mb-0"><i class="fas fa-list me-2"></i>Upcoming Appointments</h5>
                            <button class="btn btn-custom float-animation">
                                <i class="fas fa-plus me-2"></i>New Appointment
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Agent</th>
                                            <th>Property</th>
                                            <th>Date & Time</th>
                                            <th>Location</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="animate__animated animate__fadeIn">
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="https://ui-avatars.com/api/?name=John+Doe&background=random" 
                                                         class="rounded-circle me-2" style="width: 40px; height: 40px;">
                                                    John Doe
                                                </div>
                                            </td>
                                            <td>Luxury Villa</td>
                                            <td>2025-03-15 10:00:00</td>
                                            <td>Colombo</td>
                                            <td><span class="badge badge-confirmed">Confirmed</span></td>
                                            <td>
                                                <button class="btn btn-custom btn-sm me-2">
                                                    <i class="fas fa-edit"></i>
                                                </button>
                                                <button class="btn btn-custom btn-sm">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </td>
                                        </tr>
                                        <!-- Add more appointment rows as needed -->
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    <script src="https://cdn.jsdelivr.net/particles.js/2.0.0/particles.min.js"></script>

    <script>
        // Initialize Particles.js
        particlesJS("particles-js", {
            particles: {
                number: { value: 80, density: { enable: true, value_area: 800 } },
                color: { value: "#4a90e2" },
                shape: { type: "circle" },
                opacity: {
                    value: 0.5,
                    random: true,
                    animation: { enable: true, speed: 1, opacity_min: 0.1, sync: false }
                },
                size: {
                    value: 3,
                    random: true,
                    animation: { enable: true, speed: 2, size_min: 0.1, sync: false }
                },
                line_linked: {
                    enable: true,
                    distance: 150,
                    color: "#4a90e2",
                    opacity: 0.4,
                    width: 1
                },
                move: {
                    enable: true,
                    speed: 2,
                    direction: "none",
                    random: true,
                    straight: false,
                    out_mode: "out",
                    bounce: false,
                    attract: { enable: true, rotateX: 600, rotateY: 1200 }
                }
            },
            interactivity: {
                detect_on: "canvas",
                events: {
                    onhover: { enable: true, mode: "repulse" },
                    onclick: { enable: true, mode: "push" },
                    resize: true
                },
                modes: {
                    repulse: { distance: 100, duration: 0.4 },
                    push: { particles_nb: 4 }
                }
            },
            retina_detect: true
        });

        // Initialize Select2
        $(document).ready(function() {
            $('.location-select').select2();

            // Initialize DateRangePicker for appointment datetime
            $('#appointment-datetime').daterangepicker({
                singleDatePicker: true,
                timePicker: true,
                timePicker24Hour: true,
                locale: {
                    format: 'YYYY-MM-DD HH:mm:ss'
                }
            });

            // Update current time
            function updateTime() {
                const timeElement = document.getElementById('current-time');
                const now = new Date();
                const formattedTime = now.toISOString().slice(0, 19).replace('T', ' ');
                timeElement.textContent = formattedTime;
            }
            setInterval(updateTime, 1000);
        });
    </script>
</body>
</html>