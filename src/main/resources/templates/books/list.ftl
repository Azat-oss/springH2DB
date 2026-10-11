<#import "../layout.ftl" as layout>

<@layout.page title="Список книг">
    <div class="page-header">
        <h2>Список книг</h2>
    </div>

    <div class="form-actions" style="margin-bottom: 20px;">
        <a class="btn" href="/books/new">Добавить книгу</a>
    </div>

    <table class="table">
        <thead>
            <tr>
                <th>Название</th>
                <th>Автор (ФИО)</th>
                <th>Год выпуска</th>
                <th>Стиль</th>
                <th>Страниц</th>
                <th>Описание</th>
                <th>Действия</th>
            </tr>
        </thead>
        <tbody>
            <#list books as book>
            <tr>
                <td><a href="/books/${book.id?c}">${book.bookName?html}</a></td>
                <td>${book.authorName?html}</td>
                <td>${book.releaseYear?c}</td>
                <td>${book.genre?html}</td>
                <td>${book.pageCount?c}</td>
                <td>${(book.description!'')?html}</td>
                <td>
                    <form method="post" action="/books/${book.id?c}/delete" onsubmit="return confirm('Удалить книгу?');">
                        <button class="btn btn-outline" type="submit">Удалить</button>
                    </form>
                </td>
            </tr>
            </#list>
        </tbody>
    </table>
</@layout.page>