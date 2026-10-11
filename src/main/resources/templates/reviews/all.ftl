<#import "../layout.ftl" as layout>

<@layout.page title="Все отзывы">
    <div class="page-header"><h2>Все отзывы пользователей</h2></div>

    <#list reviews as review>
        <div class="card" style="margin-bottom: 15px;">
            <div class="card-body">
                <h4><a href="/books/${review.book.id?c}">${review.book.bookName?html}</a></h4>
                <strong>${review.user.username?html}</strong>
                — Оценка: <span style="color: gold;">${review.rating?switch(5, "★★★★★", 4, "★★★★☆", 3, "★★★☆☆", 2, "★★☆☆☆", 1, "★☆☆☆☆", "☆☆☆☆☆")}</span>
                <br/>
                <#if review.comment??>
                    <p>${review.comment?html}</p>
                </#if>
            </div>
        </div>
    <#else>
        <p>Отзывов пока нет.</p>
    </#list>
</@layout.page>