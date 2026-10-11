<#import "../layout.ftl" as layout>

<@layout.page title="Вход">
    <div class="page-header"><h2>Вход в систему</h2></div>
    <div class="card form-card">
        <div class="card-body">
            <#if error??>
                <span class="field-error" style="color:red; display:block; margin-bottom:10px;">Неверный логин или пароль</span>
            </#if>
            <form method="post" action="/auth/login">
                <div class="field">
                    <label for="username">Логин</label>
                    <input type="text" id="username" name="username" required />
                </div>
                <div class="field">
                    <label for="password">Пароль</label>
                    <input type="password" id="password" name="password" required />
                </div>
                <div class="form-actions">
                    <button class="btn" type="submit">Войти</button>
                    <a class="btn btn-outline" href="/auth/register">Регистрация</a>
                </div>
            </form>
        </div>
    </div>
</@layout.page>