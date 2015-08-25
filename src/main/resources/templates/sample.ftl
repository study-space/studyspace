<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
</head>
<body>

<h1>${message}</h1>
<div>
    <h2>Languages</h2>

    <ul>
    <#list languages as language>
        <li>
        ${language_index + 1}. ${language}
        </li>
    </#list>
    </ul>

</div>

</body>
</html>