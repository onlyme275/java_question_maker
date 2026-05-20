<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Create Account</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #4f46e5;
            --primary-hover: #4338ca;
            --background: #f9fafb;
            --card-bg: #ffffff;
            --text-main: #111827;
            --text-muted: #6b7280;
            --border: #e5e7eb;
            --error: #ef4444;
            --error-bg: #fef2f2;
        }

        body {
            margin: 0;
            font-family: 'Inter', system-ui, -apple-system, sans-serif;
            background-color: var(--background);
            color: var(--text-main);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .main-content {
            flex: 1;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 2rem 1rem;
        }

        .register-card {
            background: var(--card-bg);
            border-radius: 1rem;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 28rem;
            padding: 2.5rem;
            animation: fadeIn 0.4s ease-out forwards;
            opacity: 0;
            transform: translateY(10px);
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .register-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .header-badge {
            width: 3rem;
            height: 3rem;
            margin: 0 auto 1rem;
            border-radius: 999px;
            background: rgba(79, 70, 229, 0.1);
            color: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .register-header h2 {
            margin: 0 0 0.5rem 0;
            font-size: 1.875rem;
            font-weight: 600;
            color: var(--text-main);
            letter-spacing: -0.025em;
        }

        .register-header p {
            margin: 0;
            color: var(--text-muted);
            font-size: 0.95rem;
            line-height: 1.5;
        }

        .form-group {
            margin-bottom: 1.25rem;
        }

        .form-row {
            display: flex;
            gap: 1rem;
        }

        .form-row .form-group {
            flex: 1;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            font-size: 0.875rem;
            color: #374151;
        }

        .label-row {
            display: flex;
            align-items: center;
            gap: 0.4rem;
        }

        .label-row svg {
            color: var(--primary);
            flex-shrink: 0;
        }

        .form-control {
            width: 100%;
            padding: 0.625rem 0.875rem;
            border: 1px solid var(--border);
            border-radius: 0.5rem;
            font-size: 0.95rem;
            font-family: inherit;
            color: var(--text-main);
            background-color: #fff;
            transition: all 0.15s ease-in-out;
            box-sizing: border-box;
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
        }

        .form-control:focus {
            outline: none;
            border-color: var(--primary);
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.2);
        }

        .form-control::placeholder {
            color: #9ca3af;
        }

        .field-hint {
            margin-top: 0.4rem;
            font-size: 0.8rem;
            color: var(--text-muted);
        }

        .btn-submit {
            width: 100%;
            padding: 0.75rem 1rem;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 0.5rem;
            font-size: 1rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.15s ease-in-out;
            margin-top: 1rem;
            box-shadow: 0 1px 2px 0 rgba(0, 0, 0, 0.05);
        }

        .btn-submit:hover {
            background-color: var(--primary-hover);
        }

        .btn-submit:focus {
            outline: none;
            box-shadow: 0 0 0 3px rgba(79, 70, 229, 0.4);
        }

        .btn-submit:active {
            transform: scale(0.98);
        }

        .error-message {
            background-color: var(--error-bg);
            color: var(--error);
            padding: 0.75rem 1rem;
            border-radius: 0.5rem;
            font-size: 0.875rem;
            font-weight: 500;
            margin-bottom: 1.5rem;
            border: 1px solid #fecaca;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .footer-link {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.875rem;
            color: var(--text-muted);
        }

        .footer-link a {
            color: var(--primary);
            text-decoration: none;
            font-weight: 600;
            transition: color 0.15s ease-in-out;
        }

        .footer-link a:hover {
            text-decoration: underline;
            color: var(--primary-hover);
        }

        @media (max-width: 640px) {
            .register-card {
                padding: 2rem 1.25rem;
            }

            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
    </style>
</head>
<body>
<jsp:include page="/components/header.jsp"/>

<div class="main-content">
    <div class="register-card">
        <div class="register-header">
            <div class="header-badge" aria-hidden="true">
                <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="22" height="22">
                    <path d="M12 12a4 4 0 1 0-4-4 4 4 0 0 0 4 4Zm0 2c-4.42 0-8 1.79-8 4v1h16v-1c0-2.21-3.58-4-8-4Z"/>
                </svg>
            </div>
            <h2>Create your account</h2>
            <p>Set up your profile to start exploring quizzes and managing your progress.</p>
        </div>

        <div class="error-message" style="${empty error ? 'display: none;' : ''}">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="20" height="20" style="flex-shrink: 0;">
                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
            </svg>
            <span>${error}</span>
        </div>

        <form action="register" method="post">
            <div class="form-group">
                <label for="username">
                    <span class="label-row">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="16" height="16">
                            <path d="M12 12a4 4 0 1 0-4-4 4 4 0 0 0 4 4Zm0 2c-4.42 0-8 1.79-8 4v1h16v-1c0-2.21-3.58-4-8-4Z"/>
                        </svg>
                        Username
                    </span>
                </label>
                <input type="text" id="username" name="username" class="form-control" placeholder="Enter your username" value="${param.username}" required>
            </div>

            <div class="form-row">
                <div class="form-group">
                    <label for="age">
                        <span class="label-row">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="16" height="16">
                                <path d="M12 2a10 10 0 1 0 10 10A10 10 0 0 0 12 2Zm1 11h4v2h-6V7h2Z"/>
                            </svg>
                            Age
                        </span>
                    </label>
                    <input type="number" id="age" name="age" class="form-control" placeholder="18" min="1" value="${param.age}" required>
                </div>

                <div class="form-group">
                    <label for="address">
                        <span class="label-row">
                            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="16" height="16">
                                <path d="M12 2a7 7 0 0 0-7 7c0 5.25 7 13 7 13s7-7.75 7-13a7 7 0 0 0-7-7Zm0 9.5A2.5 2.5 0 1 1 14.5 9 2.5 2.5 0 0 1 12 11.5Z"/>
                            </svg>
                            Address
                        </span>
                    </label>
                    <input type="text" id="address" name="address" class="form-control" placeholder="Dulari, Nepal" value="${param.address}" required>
                </div>
            </div>

            <div class="form-group">
                <label for="email">
                    <span class="label-row">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="16" height="16">
                            <path d="M4 4h16a2 2 0 0 1 2 2v.4l-10 6.25L2 6.4V6a2 2 0 0 1 2-2Zm18 4.75V18a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V8.75l9.47 5.92a1 1 0 0 0 1.06 0Z"/>
                        </svg>
                        Email
                    </span>
                </label>
                <input type="email" id="email" name="email" class="form-control" placeholder="name@example.com" value="${param.email}" required>
            </div>

            <div class="form-group">
                <label for="password">
                    <span class="label-row">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="16" height="16">
                            <path d="M17 8h-1V6a4 4 0 0 0-8 0v2H7a2 2 0 0 0-2 2v10h14V10a2 2 0 0 0-2-2Zm-7-2a2 2 0 0 1 4 0v2h-4Z"/>
                        </svg>
                        Password
                    </span>
                </label>
                <input type="password" id="password" name="password" class="form-control" placeholder="At least 6 characters" required>
                <div class="field-hint">Use at least 6 characters so your account stays protected.</div>
            </div>

            <div class="form-group">
                <label for="confirmPassword">
                    <span class="label-row">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" width="16" height="16">
                            <path d="M17 8h-1V6a4 4 0 0 0-8 0v2H7a2 2 0 0 0-2 2v10h14V10a2 2 0 0 0-2-2Zm-7-2a2 2 0 0 1 4 0v2h-4Zm7 7-6 6-3-3 1.41-1.41L11 16.17l4.59-4.58Z"/>
                        </svg>
                        Confirm Password
                    </span>
                </label>
                <input type="password" id="confirmPassword" name="confirmPassword" class="form-control" placeholder="Re-enter your password" required>
            </div>

            <button type="submit" class="btn-submit">Register</button>
        </form>

        <div class="footer-link">
            Already have an account? <a href="login">Sign in here</a>
        </div>
    </div>
</div>

<jsp:include page="/components/footer.jsp"/>
</body>
</html>
