(defun refactor--process-files (dir-name policy)
  (setq dir-files (directory-files dir-name))
  (dolist (element dir-files)
    (unless (or (string= "." element)
		(string= ".." element)
		(file-directory-p element))
      (find-file element)
      (print element)
      (funcall policy (point-min) (point-max))
      (save-buffer))))

(defun untabify-dir ()
  "Untabify the contents of a folder"
  (interactive)
  (let ((dir-name
	 "~/storage/shared/Documents/my-org-and-obsidian/my-org-notes"
	 ))
    (refactor--process-files dir-name 'untabify))
  )


;; creates directories recursively. Eg: /home/ardie/Documents/delete/my-org-files/hello/inside/temp.txt, ignores project base leaving "hello" and "inside" to create
(defun  m-maybe-create-dir(full_fname)
  (let ((m-dir-base "~/storage/shared/Documents/my-org-and-obsidian/my-oob-notes/")
	(m-dir-to-create
	 (file-name-parent-directory (nth 1 (split-string full_fname "~/storage/shared/Documents/my-org-and-obsidian/my-oob-notes/")))))
    (print m-dir-base)
    (print m-dir-to-create)
    (dolist (m-dir (file-name-split m-dir-to-create))
      (setq m-dir-base (concat m-dir-base "/" m-dir))
      (condition-case error
	  (make-directory
	   m-dir-base
	   )
	('error nil)))))



;; NOTE: since this is only a single execution everytimme,
;; and we only have a single project,
;; we dont need to play around putting "my-org" into a variable
(setq org-publish-project-alist
      '(("my-org"
	 :base-directory "~/storage/shared/Documents/my-org-and-obsidian/my-org-notes"
	 :recursive t
	 :publishing-function org-md-publish-to-md
	 :publishing-directory "~/storage/shared/Documents/my-org-and-obsidian/my-oob-notes"
	 :base_extension "org"
	 :with-sub-superscript nil
	 :section-numbers nil
	 :base-extension "org"
	 :with-toc nil)))

(setq rd-a-project (assoc "my-org" org-publish-project-alist))
(setq ardie/list-of-post-publish 'nil)
(setq ardie/list-of-previous-publish 'nil)

;; initilialize first, otherwise, org-publish-cache produces error
(org-publish-initialize-cache "my-org")


;; hard remove all files, coz intelligent script too expensive
(dolist (rd-long-filename (directory-files-recursively "~/storage/shared/Documents/my-org-and-obsidian/my-oob-notes" "\\.*"))
  (delete-file rd-long-filename)
  )




(org-publish-project "my-org" t)


(dolist (m-source-full-name (directory-files-recursively "~/storage/shared/Documents/my-org-and-obsidian/my-org-notes" "\\.png$")) 
  (let ((m-target-filename (concat "~/storage/shared/Documents/my-org-and-obsidian/my-oob-notes" (nth 1 (split-string m-source-full-name "~/storage/shared/Documents/my-org-and-obsidian/my-org-notes")))))
    (m-maybe-create-dir m-target-filename)
    (copy-file m-source-full-name m-target-filename t)))

(dolist (m-source-full-name (directory-files-recursively "~/storage/shared/Documents/my-org-and-obsidian/my-org-notes" "\\.jpg$")) 
  (let ((m-target-filename (concat "~/storage/shared/Documents/my-org-and-obsidian/my-oob-notes" (nth 1 (split-string m-source-full-name "~/storage/shared/Documents/my-org-and-obsidian/my-org-notes")))))
    (m-maybe-create-dir m-target-filename)
    (copy-file m-source-full-name m-target-filename t)))

(dolist (m-source-full-name (directory-files-recursively "~/storage/shared/Documents/my-org-and-obsidian/my-org-notes" "\\.jpeg$")) 
  (let ((m-target-filename (concat "~/storage/shared/Documents/my-org-and-obsidian/my-oob-notes" (nth 1 (split-string m-source-full-name "~/storage/shared/Documents/my-org-and-obsidian/my-org-notes")))))
    (m-maybe-create-dir m-target-filename)
    (copy-file m-source-full-name m-target-filename t)))




(save-buffers-kill-terminal)
