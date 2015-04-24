WBExport -type=text
         -file='c:/scripts/boopsie/catalog_extract_full.txt'
         -delimiter=\t
	       -header=false
         -lineEnding=crlf
         -encoding=utf8;
SELECT 
  'b' || rm.record_num AS recordnum, 
  brp.best_title as title, 
  brp.best_author as author,
  regexp_replace(vp.field_content, '^.*\|b(.*)\|.*', '\1') as publisher,
  brp.publish_year,
  mpn.name as format,
  regexp_replace(vi.field_content, '\|[a-z]([0-9x]{9,13}).*', '\1', 'i') as ISBN
FROM 
  sierra_view.bib_record b 
  JOIN sierra_view.bib_record_property brp ON brp.bib_record_id = b.record_id 
  JOIN sierra_view.record_metadata rm ON rm.id = brp.bib_record_id
  JOIN sierra_view.material_property mp ON brp.material_code = mp.code
  JOIN sierra_view.material_property_name mpn ON mpn.material_property_id = mp.id
  LEFT OUTER JOIN sierra_view.varfield vi ON b.record_id = vi.record_id AND vi.marc_tag = '020' AND vi.occ_num = '0'
  LEFT OUTER JOIN sierra_view.varfield vp ON b.record_id = vp.record_id AND vp.marc_tag = '260'
WHERE 
  b.is_suppressed = 'f'
ORDER BY
  rm.record_num ASC;
