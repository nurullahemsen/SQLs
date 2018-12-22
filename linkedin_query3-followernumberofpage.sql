SELECT
 page.page_id,
 COUNT (follow_page.user_id)
FROM
 follow_page,page
WHERE page.page_id = follow_page.page_id
GROUP BY
 page.page_id;