<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">

<h2 class="text-center">Login</h2>

<form method="post" action="${pageContext.request.contextPath}/dologin" class="mt-3">
    <div class="mb-3">
        <label class="form-label">Username</label>
        <input class="form-control" type="text" name="username" required>
    </div>
    <div class="mb-3">
        <label class="form-label">Password</label>
        <input class="form-control" type="password" name="password" required>
    </div>
    <button class="btn btn-primary w-100" type="submit">Login</button>
</form>

<hr>

<div class="text-center">
    <a class="btn btn-link" href="/register">Create New Account</a><br>
    <a class="btn btn-outline-dark" href="/oauth2/authorization/google">
        Login with Google
    </a>
</div>

</body>
</html>
