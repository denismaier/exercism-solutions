;;; leap.el --- Leap exercise (exercism)

;;; Commentary:

;;; Code:


(provide 'leap-year-p)

(defun leap-year-p (year)
  (and (eq (% year 4) 0)
       (or 
        (not (eq (% year 100) 0))
        (eq (% year 400) 0))))

;;; leap.el ends here
