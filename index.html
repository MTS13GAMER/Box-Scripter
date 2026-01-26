<?php
$file = 'users.json';
if (!file_exists($file)) file_put_contents($file, json_encode([]));
$users = json_decode(file_get_contents($file), true);
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $data = json_decode(file_get_contents('php://input'), true);
    if ($_GET['action'] === 'register') {
        $users[$data['user']] = $data['pass'];
        file_put_contents($file, json_encode($users, JSON_PRETTY_PRINT));
        echo json_encode(['status'=>'ok','msg'=>'Cadastrado']);
        exit;
    }
    if ($_GET['action'] === 'login') {
        if (isset($users[$data['user']]) && $users[$data['user']] === $data['pass']) {
            echo json_encode(['status'=>'ok','msg'=>'Conseguiu entrar']);
        } else {
            echo json_encode(['status'=>'fail','msg'=>'Login inválido']);
        }
        exit;
    }
}
?>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8">
<title>Login Teste</title>
<style>
body{background:#0f172a;color:#fff;font-family:Arial;display:flex;justify-content:center;align-items:center;height:100vh}
.box{background:#111827;padding:25px;border-radius:10px;width:300px;border-radius:10px}
input,button{width:100%;margin-top:10px;padding:10px;border:none;border-radius:6px}
button{background:#2563eb;color:white}
.msg{text-align:center;margin-top:10px}
</style>
</head>
<body>
<div class="box">
<h3>Cadastro</h3>
<input id="ruser" placeholder="Usuário">
<input id="rpass" placeholder="Senha">
<button onclick="register()">Cadastrar</button>
<hr>
<h3>Login</h3>
<input id="luser" placeholder="Usuário">
<input id="lpass" placeholder="Senha">
<button onclick="login()">Entrar</button>
<div class="msg" id="msg"></div>
</div>
<script>
async function register(){
await fetch('?action=register',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({user:ruser.value,pass:rpass.value})})
}
async function login(){
const res = await fetch('?action=login',{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify({user:luser.value,pass:lpass.value})})
const j = await res.json()
document.getElementById('msg').innerText = j.msg
}
</script>
</body>
</html>
