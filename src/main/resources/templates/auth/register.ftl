<#import "../layout.ftl" as layout>

<@layout.page title="Регистрация">
    <div class="page-header"><h2>Регистрация</h2></div>
    <div class="card form-card">
        <div class="card-body">
            <form method="post" action="/auth/register">
                <div class="field">
                    <label for="username">Логин</label>
                    <input type="text" id="username" name="username" required maxlength="255" />
                </div>
                <div class="field">
                    <label for="password">Пароль</label>
                    <input type="password" id="password" name="password" required />
                </div>
                <div class="form-actions">
                    <button class="btn" type="submit">Зарегистрироваться</button>
                    <a class="btn btn-outline" href="/auth/login">Уже есть аккаунт</a>
                </div>
            </form>
        </div>
    </div>
</@layout.page>