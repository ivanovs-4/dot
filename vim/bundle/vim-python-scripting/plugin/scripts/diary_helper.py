# -*- coding: utf-8 -*-

import os
import re
import sys
import vim
import vimhelper

from datetime import date


WEEK_DAYS = [
    'Понедельник', 'Вторник', 'Среда',
    'Четверг', 'Пятница', 'Суббота', 'Воскресенье', ]

MONTHS = [
    'января', 'февраля', 'марта', 'апреля', 'мая', 'июня',
    'июля', 'августа', 'сентября', 'октября', 'ноября', 'декабря', ]


@vimhelper.make_vimfunction
def make_header(*args):
    text_template = \
        '''%(place)s,\n''' + \
        '''%(when)s,\n''' + \
        '''%(who)s.\n\n'''

    d = date.today()

    when = '{}, {} {} {}г'.format(
        WEEK_DAYS[d.weekday()],
        d.day,
        MONTHS[d.month - 1],
        d.year
    )

    text = text_template % {
        'place': 'Екатеринбург',
        'when': when,
        'who': 'Сергей Иванов',
    }

    text = indent_text(text, 36)

    return text


vim.command(':nmap <F2> 0yP<c-r>=Make_header()<cr><esc>0i')


def indent_text(text, count, filler=' '):
    prefix = str(filler) * count
    lines = text.split('\n')
    prefixed_lines = [prefix + line for line in lines]
    text = '\n'.join(prefixed_lines)

    return text

