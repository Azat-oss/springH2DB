<#import "../layout.ftl" as layout>

<@layout.page title="Новый отзыв">
    <div class="page-header"><h2>Новый отзыв</h2></div>
    <div class="card form-card">
        <div class="card-body">
            <form method="post" action="/reviews?bookId=${bookId?c}">
                <div class="field">
                    <label for="rating">Оценка (1-5)</label>
                    <input type="number" id="rating" name="rating" required min="1" max="5" value="5" />
                </div>
                <div class="field">
                    <label for="comment">Комментарий</label>
                    <textarea id="comment" name="comment" rows="4" placeholder="Ваши впечатления..."></textarea>
                </div>
                <div class="form-actions">
                    <button class="btn" type="submit">Отправить</button>
                    <a class="btn btn-outline" href="/books/${bookId?c}">Отмена</a>
                </div>
            </form>
        </div>
    </div>
</@layout.page>