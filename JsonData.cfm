<!DOCTYPE html>
<html>
<head>
<title>
JSON Verisi Alma
</title>
</head>
<body>
<div id="veriAlani">
</div>

<script>
fetch('https://dummyjson.com/posts')
    .then(response => response.json())
    .then(data => {
    let veriAlani = document.getElementById('veriAlani');
    data.posts.forEach(post => {
    let baslik = document.createElement('h2');
    baslik.textContent = post.title;
    veriAlani.appendChild(baslik);
    let icerik = document.createElement('p');
    icerik.textContent = post.body;
    veriAlani.appendChild(icerik);
    });
    })
    .catch(error => console.error('Hata:', error));
</script>
</body>
</html>