<#macro page title="Книги">
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title>${title} — Book CRUD</title>
        <link rel="stylesheet" href="/css/style.css"/>
    </head>
    <body>
    <header class="site-header">
        <div class="container">
            <h1 class="brand">
                Book CRUD GRID
                <span class="brand-subtitle">Spring MVC + Apache FreeMarker + H2</span>
            </h1>
            <nav class="site-nav">
                <a href="/books">Книги</a>
                <a href="/reviews/all">Все отзывы</a>
                <#if currentUser??>
                    <span style="color: white; margin-right: 10px;">Привет, ${currentUser?html}!</span>
                    <a href="/auth/logout">Выйти</a>
                <#else>
                    <a href="/auth/login">Войти</a>
                    <a href="/auth/register">Регистрация</a>
                </#if>
            </nav>
        </div>
    </header>

    <main class="container">
        <#nested />
    </main>

    <footer class="site-footer">
        <div class="container">Spring MVC demo application</div>
    </footer>
    </body>
    </html>
</#macro>