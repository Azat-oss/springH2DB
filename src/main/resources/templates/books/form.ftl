<#import "../layout.ftl" as layout>

<#if (mode!'create') == "create">
    <#assign formAction = "/books" />
    <#assign submitLabel = "Создать" />
    <#assign pageTitle = "Новая книга" />
<#else>
    <#assign formAction = "/books/${book.id!''}" />
    <#assign submitLabel = "Сохранить" />
    <#assign pageTitle = "Редактирование книги" />
</#if>

<@layout.page title=pageTitle>
    <div class="page-header">
        <h2>${pageTitle}</h2>
    </div>

    <div class="card form-card">
        <div class="card-body">
            <form method="post" action="${formAction}">

                <div class="field<#if bindingResult?? && bindingResult.hasFieldErrors('bookName')> has-error</#if>">
                    <label for="bookName">Название книги</label>
                    <input type="text" id="bookName" name="bookName" required maxlength="255"
                           placeholder="Война и мир" value="${(book.bookName!'')?html}" />
                    <#if bindingResult?? && bindingResult.hasFieldErrors("bookName")>
                        <span class="field-error">${bindingResult.getFieldError("bookName").defaultMessage?html}</span>
                    </#if>
                </div>

                <div class="field<#if bindingResult?? && bindingResult.hasFieldErrors('authorName')> has-error</#if>">
                    <label for="authorName">ФИО автора</label>
                    <input type="text" id="authorName" name="authorName" required maxlength="255"
                           placeholder="Толстой Л.Н." value="${(book.authorName!'')?html}" />
                    <#if bindingResult?? && bindingResult.hasFieldErrors("authorName")>
                        <span class="field-error">${bindingResult.getFieldError("authorName").defaultMessage?html}</span>
                    </#if>
                </div>

                <div class="field<#if bindingResult?? && bindingResult.hasFieldErrors('releaseYear')> has-error</#if>">
                    <label for="releaseYear">Год выпуска</label>
                    <input type="number" id="releaseYear" name="releaseYear" required min="1800" max="2025"
                           placeholder="1869" value="${(book.releaseYear!'')?c}" />
                    <#if bindingResult?? && bindingResult.hasFieldErrors("releaseYear")>
                        <span class="field-error">${bindingResult.getFieldError("releaseYear").defaultMessage?html}</span>
                    </#if>
                </div>

                <div class="field<#if bindingResult?? && bindingResult.hasFieldErrors('genre')> has-error</#if>">
                    <label for="genre">Стиль книги</label>
                    <input type="text" id="genre" name="genre" required maxlength="255"
                           placeholder="Роман" value="${(book.genre!'')?html}" />
                    <#if bindingResult?? && bindingResult.hasFieldErrors("genre")>
                        <span class="field-error">${bindingResult.getFieldError("genre").defaultMessage?html}</span>
                    </#if>
                </div>

                <div class="field<#if bindingResult?? && bindingResult.hasFieldErrors('pageCount')> has-error</#if>">
                    <label for="pageCount">Количество страниц</label>
                    <input type="number" id="pageCount" name="pageCount" required min="1"
                           placeholder="1225" value="${(book.pageCount!'')?c}" />
                    <#if bindingResult?? && bindingResult.hasFieldErrors("pageCount")>
                        <span class="field-error">${bindingResult.getFieldError("pageCount").defaultMessage?html}</span>
                    </#if>
                </div>

                <div class="field<#if bindingResult?? && bindingResult.hasFieldErrors('description')> has-error</#if>">
                    <label for="description">Краткое описание</label>
                    <textarea id="description" name="description" rows="4"
                              placeholder="Описание книги...">${(book.description!'')?html}</textarea>
                    <#if bindingResult?? && bindingResult.hasFieldErrors("description")>
                        <span class="field-error">${bindingResult.getFieldError("description").defaultMessage?html}</span>
                    </#if>
                </div>

                <div class="form-actions">
                    <button class="btn" type="submit">${submitLabel}</button>
                    <a class="btn btn-outline" href="/books">Отмена</a>
                </div>
            </form>
        </div>
    </div>
</@layout.page>