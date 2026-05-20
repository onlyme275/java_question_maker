<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Login</title>
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
            --success: #166534;
            --success-bg: #ecfdf3;
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

        .login-card {
            background: var(--card-bg);
            border-radius: 1rem;
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 8px 10px -6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 24rem;
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

        .login-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .login-header h2 {
            margin: 0 0 0.5rem 0;
            font-size: 1.875rem;
            font-weight: 600;
            color: var(--text-main);
            letter-spacing: -0.025em;
        }

        .login-header p {
            margin: 0;
            color: var(--text-muted);
            font-size: 0.95rem;
        }

        .form-group {
            margin-bottom: 1.25rem;
        }

        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            font-weight: 500;
            font-size: 0.875rem;
            color: #374151;
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

        .status-message {
            padding: 0.75rem 1rem;
            border-radius: 0.5rem;
            font-size: 0.875rem;
            font-weight: 500;
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .status-message.error {
            background-color: var(--error-bg);
            color: var(--error);
            border: 1px solid #fecaca;
        }

        .status-message.success {
            background-color: var(--success-bg);
            color: var(--success);
            border: 1px solid #bbf7d0;
        }

        .footer-link {
            text-align: center;
            margin-top: 1.5rem;
            font-size: 0.9rem;
            color: var(--text-muted);
            line-height: 1.5;
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
    </style>
</head>
<body>
<jsp:include page="/components/header.jsp"/>

<div class="main-content">
    <div class="login-card">
        <div class="login-header">
            <h2>Welcome Back</h2>
            <p>Please enter your details to sign in.</p>
        </div>

        <div class="status-message success" style="${param.registered eq 'true' ? '' : 'display: none;'}">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="20" height="20" style="flex-shrink: 0;">
                <path fill-rule="evenodd" d="M10 18a8 8 0 1 0-8-8 8 8 0 0 0 8 8Zm3.71-9.29a1 1 0 0 0-1.42-1.42L9 10.59 7.71 9.29a1 1 0 1 0-1.42 1.42l2 2a1 1 0 0 0 1.42 0Z" clip-rule="evenodd" />
            </svg>
            <span>Registration successful. You can sign in now.</span>
        </div>

        <div class="status-message error" style="${empty error ? 'display: none;' : ''}">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" fill="currentColor" width="20" height="20" style="flex-shrink: 0;">
                <path fill-rule="evenodd" d="M18 10a8 8 0 11-16 0 8 8 0 0116 0zm-7 4a1 1 0 11-2 0 1 1 0 012 0zm-1-9a1 1 0 00-1 1v4a1 1 0 102 0V6a1 1 0 00-1-1z" clip-rule="evenodd" />
            </svg>
            <span>${error}</span>
        </div>

        <form action="login" method="post">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" class="form-control" placeholder="name@example.com" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" class="form-control" placeholder="Enter your password" required>
            </div>

            <button type="submit" class="btn-submit">Sign In</button>
        </form>

        <div class="footer-link">
            Don't have an account? <a href="register">Create one</a>
        </div>
    </div>
</div>

<jsp:include page="/components/footer.jsp"/>
</body>
</html>
