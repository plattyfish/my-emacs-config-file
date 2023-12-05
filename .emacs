;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.


(package-initialize)

 ;;center the frame
(defun frame-center ()
  "Center the current frame."
  (interactive)
  (let* ((dw (display-pixel-width))
         (dh (display-pixel-height))
         (f  (selected-frame))
         (fw (frame-pixel-width f))
         (fh (frame-pixel-height f))
         (x  (- (/ dw 2) (/ fw 2)))
         (y  (- (/ dh 2) (/ fh 2))))
    (message (format "dw %d dh %d fw %d fh %d x %d y %d" dw dh fw fh x y))
    (set-frame-position f x y)))


 




;;for soccor


;;; bootstrap straight
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
	(url-retrieve-synchronously
	  "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	     'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; install use-package
(straight-use-package 'use-package)



(use-package soccer
:straight (soccer :type git :host github :repo "md-arif-shaikh/soccer"))
    


  





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; deft                                                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'deft)
(setq deft-directory "~/org-roam")
(setq deft-extension "org")
(setq deft-text-mode 'org-mode)
(setq deft-recursive t)
(setq side-notes-file "notes.org")
(setq deft-use-filename-as-title t)
(setq deft-auto-save-interval 0)
;;key to launch deft
(global-set-key (kbd "C-c d") 'deft)
(global-set-key (kbd "C-c C-j") 'org-journal-new-entry)
(global-set-key (kbd "C-v") 'avy-goto-char)
(global-set-key (kbd "C-c i") 'diary-manager-edit)
(global-set-key (kbd "C-c e") 'insert-current-date)
(global-set-key (kbd "C-c f") 'deft-new-file-named)      
(global-set-key (kbd "C-c s") 'org-journal-search-forever) 
(global-set-key (kbd "C-# w") 'side-notes-toggle-notes)
(global-set-key (kbd "M-s s") 'ispell-word)
(global-set-key (kbd "M-s b")  'ispell-buffer)
;; org-roam
(global-set-key (kbd "C-c n l") 'org-roam-buffer-toggle)
(global-set-key (kbd "C-c n f") 'org-roam-node-find)
(global-set-key (kbd "C-c n v") 'org-roam-node-visit)
(global-set-key (kbd "C-c n i") 'org-roam-node-insert)
(global-set-key (kbd "C-c w s")  'dictionary-search)
(global-set-key (kbd "C-c n d") 'org-roam-dailies-goto-today)
(global-set-key (kbd "C-c n t") 'org-roam-dailies-goto-tomorrow)
(global-set-key (kbd "C-c n y") 'org-roam-dailies-goto-yesterday)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my/org-roam-capture-inbox ()
  (interactive)
  (org-roam-capture- :node (org-roam-node-create)
                     :templates '(("i" "inbox" plain "* %?"
                                  :if-new (file+head "Inbox.org" "#+title: Inbox\n")))))

(global-set-key (kbd "C-c n b") #'my/org-roam-capture-inbox)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; abbreviations                                                          ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default abbrev-mode t)
;; save abbreviations upon exiting xemacs
(setq save-abbrevs t)
;; set the file storing the abbreviations
(setq abbrev-file-name "~/.emacs.d/jims-abbrevs.el")
;; reads the abbreviations file on startup
(quietly-read-abbrev-file)

(global-set-key (kbd "C-<f5>") 'linum-mode)

(global-set-key (kbd "C-?") 'help-command)

(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

(setq calendar-week-start-day 1)
(require 'howm)
(require 'transpose-frame)
(require 'popwin)
(popwin-mode 1)
(beacon-mode 1)
(savehist-mode 1)
(which-key-mode 1)

(winner-mode 1)

(defun insert-current-date () (interactive)
    (insert (shell-command-to-string "echo -n $(date +%d.%m.%Y)")))

;; Show hide dot files in dired
(defun dired-dotfiles-toggle ()
    "Show/hide dot-files"
    (interactive)
    (when (equal major-mode 'dired-mode)
      (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p) ; if currently showing
	  (progn 
	    (set (make-local-variable 'dired-dotfiles-show-p) nil)
	    (message "h")
	    (dired-mark-files-regexp "^\\\.")
	    (dired-do-kill-lines))
	(progn (revert-buffer) ; otherwise just revert to re-show
	       (set (make-local-variable 'dired-dotfiles-show-p) t)))))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["black" "red3" "ForestGreen" "yellow3" "blue" "magenta3" "DeepSkyBlue" "gray50"])
 '(calendar-date-style 'european)
 '(column-number-mode t)
 '(custom-enabled-themes '(abyss))
 '(custom-safe-themes
   '("748d024b0d016cc0e7a4326577ce12c6bc918b273acecd355548d7477ad2fc5c" "b46ee2c193e350d07529fcd50948ca54ad3b38446dcbd9b28d0378792db5c088" default))
 '(default-frame-alist
    '((tool-bar-lines . 0)
      (width . 135)
      (height . 36)
      (background-color . "black")))
 '(diary-comment-start "&")
 '(diary-list-entries-hook '(diary-sort-entries))
 '(display-time-mode t)
 '(initial-buffer-choice t)
 '(ispell-dictionary nil)
 '(org-agenda-files
   '("~/org-roam/20231107152331-diary_events.org" "/home/james/org-roam/20220830231119-contacts.org" "/home/james/org-roam/20220829174320-todo.org" "/home/james/org/prac1.org" "/home/james/git/org/refile.org" "/home/james/git/org/diary.org" "/home/james/org/toad.org"))
 '(org-agenda-inhibit-startup nil)
 '(org-capture-templates
   '(("1" "mood" entry
      (file "~/git/org/mood.org")
      "* %? :MOOD:
%U
%a
")
     ("2" "thoughts" entry
      (file "~/git/org/thoughts.org")
      "* %? :THOUGHTS:
%U
%a
")
     ("t" "todo" entry
      (file "~/git/org/refile.org")
      "* TODO %?
%U
%a
" :clock-in t :clock-resume t)
     ("r" "respond" entry
      (file "~/git/org/refile.org")
      "* NEXT Respond to %:from on %:subject
SCHEDULED: %t
%U
%a
" :immediate-finish t :clock-in t :clock-resume t)
     ("n" "note" entry
      (file "~/git/org/refile.org")
      "* %? :NOTE:
%U
%a
")
     ("j" "Journal" entry
      (file+olp+datetree "~/git/org/diary.org")
      "* %?
%U
")
     ("w" "org-protocol" entry
      (file "~/git/org/refile.org")
      "* TODO Review %c
%U
" :immediate-finish t)
     ("m" "Meeting" entry
      (file "~/git/org/refile.org")
      "* MEETING with %? :MEETING:
%U" :clock-in t :clock-resume t)
     ("p" "Phone call" entry
      (file "~/git/org/refile.org")
      "* PHONE %? :PHONE:
%U")
     ("q" "Quick-Note" entry
      (file "~/git/org/quick-notes.org")
      "* %? :NOTE:
%U
%a
")
     ("h" "Habit" entry
      (file "~/git/org/refile.org")
      "*  %?
%U
%a
SCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")
:PROPERTIES:
:STYLE: habit
:REPEAT_TO_STATE: NEXT
:END:
")))
 '(org-drawers
   '("PROPERTIES" "CLOCK" "LOGBOOK" "RESULTS" "NOTES" "PEOPLE"))
 '(org-log-into-drawer t)
 '(org-support-shift-select 'always)
 '(org-tags-column -120)
 '(package-archives
   '(("gnu" . "http://elpa.gnu.org/packages/")
     ("Melpa" . "https://stable.melpa.org/packages/")))
 '(package-selected-packages
   '(abyss-theme nano-agenda org org-plus-contrib org-contacts treemacs selectrum helm eterm-256color company-ebdb org-roam diary-manager deadgrep binclock avy-migemo ace-isearch adafruit-wisdom ilist blist bbdb hydandata-light-theme addressbook-bookmark calfw-cal hercules guide-key on-screen eldoc frame-tabs emms bongo beacon transpose-frame dashboard-ls ebdb org-doing org-wild-notifier fold-this biblio thesaurus dedicated emacs-new-buffer calfw-howm popwin alarm-clock svg-clock persist winner-mode-enable calfw browse-kill-ring ace-jump-mode rainbow-mode side-notes ## zone-matrix kiwix youdao-dictionary deft paced pabbrev openwith popup pomidor quiz ssh swiper unicode-enbox ztree windresize shell-toggle passthword org-journal org-bullets notes-mode move-text image+ gnugo gandalf-theme eimp dracula-theme dictionary dict-tree color-theme-complexity calfw-org aumix-mode anzu ace-window))
 '(send-mail-function 'sendmail-send-it)
 '(todo-categories-align 'left)
 '(todo-default-todo-file "notes2")
 '(todo-indent-to-here 3)
 '(todo-top-priorities-overrides '(("/home/james/.emacs.d/todo/notes.todo" 1 nil)))
 '(todo-wrap-lines t))




  (autoload 'shell-toggle "shell-toggle"
   "Toggles between the shell buffer and whatever buffer you are editing."
   t)
  (autoload 'shell-toggle-cd "shell-toggle"
   "Pops up a shell-buffer and insert a \"cd <file-dir>\" command." t)
  (global-set-key [M-f1] 'shell-toggle)
  (global-set-key [C-f1] 'shell-toggle-cd)





      
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Noto Sans Mono" :foundry "GOOG" :slant normal :weight normal :height 83 :width normal))))
 '(custom-themed ((t (:background "white" :foreground "white"))))
 '(highlight ((t (:background "red" :underline nil))))
 '(howm-mode-title-face ((t (:foreground "green")))))
(setq gnus-select-method '(nntp "news.btinternet.com"))
(setq gnus-read-active-file nil)
(global-set-key (kbd "M-p") 'ace-window)
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq-default word-wrap t)

(recentf-mode 1) ; keep a list of recently opened files

;; set F7 to list recently opened file

(global-visual-line-mode 1)

(progn
  ;; set arrow keys in isearch. left/right is backward/forward, up/down is history. press Return to exit
  (define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat )
  (define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance )

  (define-key isearch-mode-map (kbd "<left>") 'isearch-repeat-backward)
  (define-key isearch-mode-map (kbd "<right>") 'isearch-repeat-forward)

  (define-key minibuffer-local-isearch-map (kbd "<left>") 'isearch-reverse-exit-minibuffer)
  (define-key minibuffer-local-isearch-map (kbd "<right>") 'isearch-forward-exit-minibuffer))


(global-set-key (kbd "<f2>") 'todo-show)
(global-set-key (kbd "<f3>") 'org-agenda)
(global-set-key (kbd "<f4>") 'bookmark-bmenu-list)
(global-set-key (kbd "<f5>") 'ibuffer)
(global-set-key (kbd "<f6>") 'deft) 
(global-set-key (kbd "<f7>") 'recentf-open-files)
(global-set-key (kbd "<f8>") 'linum-mode)
(global-set-key (kbd "<f9>") 'calendar)

(diary)

(display-time)
(add-hook 'diary-hook 'appt-make-list)
(diary 0)







(setq org-directory "~/git/org")
(setq org-default-notes-file "~/git/org/refile.org")

;; I use C-c c to start capture mode
(global-set-key (kbd "C-c c") 'org-capture)

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      (quote  (("1" "Mood" entry (file "~/git/org/mood.org")                                                                                                                
		"* Mood-Type (%?)\n
Description \n%U" )


	       ("2" "Thought" entry (file "~/git/org/thoughts.org")                                                                                                     
		"* %? \n%U\n")
	       
       ("t" "Refile-todo" entry (file "~/git/org/refile.org")
               "* TODO %?\n%U" )


       ("r" "Reply-TO" entry (file "~/git/org/refile.org")
               "* :Reply To: Who?%?\n%U" )

	      ("n" "Note" entry (file "~/git/org/refile.org")
               "* :Note: %?\n%U" )



	      ("j" "Journal" entry (file+datetree "~/git/org/diary.org")
               "* %?\n%U\n" )



	      ("w" "New-Word" entry (file "~/git/org/refile.org" )
               "* :Word:  %?\n%U ")


	      ("m" "Meeting" entry (file "~/git/org/refile.org")
               "* :Meeting: with %? \n%U" )


	      ("p" "Phone call" entry (file "~/git/org/refile.org")
               "* :Phone: %? \n%U" )

	      ("s" "Shop" entry (file "~/git/org/refile.org")
               "* :Shop: %? \n%U" )
	      

	      ("3" "Quick-Note" entry (file "~/git/org/quick-notes.org")
	       "* :Quick Note: %?\n%U" )

	      ("4" "Reference" entry (file "~/org/ref.org")
	       "*  %?\n%U" )  	      
	      

	      ("i" "Idea" entry (file "~/git/org/refile.org")
               "* :Idea:  %?\n%U"))))
               


(setq org-todo-keywords
      '((sequence "TODO" "DONE" "USE" "DOING" "CHECK" "TO-BUY"  "HELP_REQUIRED" "DELEGATED" "URGENT")))











 (setq diary-manager-location "~/Documents/Diary-manager-emacs")


(require 'org-roam)

(setq org-roam-v2-ack t)
(setq org-mode-directory "~/org-roam")
 (setq org-roam-db-autosync-enable 1)
 (org-roam-db-autosync-mode)
(recentf-mode 1)
(global-auto-revert-mode 1)


;; Renaming Tags in org files
;; function that check if an entry has "tag1" and if so change it to "tag11":

(defun change-tag (old new)
  (when (member old (org-get-tags))
    (org-toggle-tag new 'on)
    (org-toggle-tag old 'off)
    ))

;;apply that function to each entry that has "tag1". You can do this with org-map-entries:
;;org-map-entries

(defun org-rename-tag (old new)
  (interactive "scurrent tag: \nsnew name: ")
  (org-map-entries
   (lambda () (change-tag old new))
   (format "+%s" old)
   nil
   ))


;; kill whole word
(defun kill-whole-word ()
  (interactive)
  (backward-word)
  (kill-word 1))
(global-set-key (kbd "C-c w w") 'kill-whole-word)


(defun set-buffer-to-courier ()
  (face-remap-add-relative 'default '(:family "Courier" :height 90)))

(add-hook 'calendar-mode-hook 'set-buffer-to-courier)

;;align tags
(add-hook 'focus-in-hook
  (lambda() (setq org-tags-column (- 5 (window-body-width))) (org-align-all-tags)))
(add-hook 'focus-out-hook
  (lambda() (setq org-tags-column (- 5 (window-body-width))) (org-align-all-tags)))


