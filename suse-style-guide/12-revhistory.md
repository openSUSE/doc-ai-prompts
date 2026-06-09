# Add revision history

When making significant changes to a document (such as adding or deleting features, 
updating images, fixing broken links or modifying metadata), you must automatically 
update the document's revision history with a brief description and the current date. 
Do not update the revision history for minor typo fixes, grammar corrections or formatting changes.

# Markup and formatting

- List revision entries in descending order by date (the newest entry must always come first).
- For AsciiDoc, update the :revdate: attribute to the current date.
- For DocBook, add a new <revision> block inside <revhistory>. Include date in the format 
<date>YYYY-MM-DD</date> and a brief summary of the change inside <revdescription>.
- If making multiple changes of the same type, group them using an <itemizedlist>.

# Example DocBook

Use: 
<revision>
<date>2026-06-09</date>
<revdescription><para>Updated chapter on storage, removed obsolete section</para></revdescription>
</revision>